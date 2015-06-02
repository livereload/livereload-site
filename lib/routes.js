var wrap = (getConfig = require('pine2e')).wrap, getConfig = getConfig.getConfig;
var model = require('./model');
var sendEmail = require('./email');

var moment = require('moment');
var STACK_SOCIAL_TOKEN = getConfig('STACK_SOCIAL_TOKEN');
var PADDLE_TOKEN = getConfig('PADDLE_TOKEN');
var MANUAL_TOKEN = getConfig('MANUAL_TOKEN');
var ADMIN_TOKEN = getConfig('ADMIN_TOKEN');
var NEW_LICENSE_NOTIFICATION_EMAIL = require('fs').readFileSync(__dirname + '/../views/emails/license-notification.txt', 'utf8');

module.exports = function(app) {
  app.get('/', function(req, res)  {
    res.render('home');
  });

  app.get('/licensing/admin/:token/', wrap(function(ctx, req, res, next)  {
    if (req.param('token') !== ADMIN_TOKEN) {
      res.send(403, 'Invalid admin token');
      return;
    }

    model.countUnclaimedLicenses(ctx).then(function(unclaimedCount)  {
      var info = { unclaimedCount: unclaimedCount };
      res.render('licensing-status', info);
    }).catch(function(e)  {
      next(e);
    });
  }));

  app.get('/licensing/callback/stacksocial', wrap(function(ctx, req, res)  {
    if (req.param('token') !== STACK_SOCIAL_TOKEN) {
      res.send(403, 'Invalid StackSocial token');
      return;
    }

    var params = {
      store: 'StackSocial',
      txn: req.param('txn'),
      firstName: req.param('first'),
      lastName: req.param('last'),
      email: req.param('email')
    };

    model.claimLicense(ctx, params).then(function(license)  {
      if (license) {
        res.send(license.licenseCode);
      } else {
        res.send(500, 'Out of licenses');
      }

      model.countUnclaimedLicenses(ctx).then(function(unclaimedCount)  {
        var info = { STORE: 'StackSocial', NAME: params.firstName + ' ' + params.lastName, EMAIL: params.email, DATE: moment().format('ddd, MMM D, YYYY HH:mm Z'), LICENSE_CODE: license.licenseCode, TXN: params.txn, UNCLAIMED: unclaimedCount };
        return sendEmail({ to: 'andrey@tarantsov.com', from: 'bot@livereload.com', replyTo: params.email }, NEW_LICENSE_NOTIFICATION_EMAIL, info);
      });
    }).done();
  }));

  app.post('/licensing/callback/paddle', wrap(function(ctx, req, res)  {
    if (req.param('token') !== PADDLE_TOKEN) {
      res.send(403, 'Invalid Paddle token');
      return;
    }

    var params = {
      store: 'Paddle',
      txn: req.param('txn'),
      fullName: req.param('name'),
      message: req.param('message'),
      email: req.param('email'),
      raw: JSON.stringify(req.body),
      currency: req.param('p_currency'),
      price: req.param('p_price'),
      coupon: stringOrNull(req.param('p_coupon')),
      savings: req.param('p_coupon_savings'),
      additional: req.param('p_coupon_savings'),
      country: req.param('p_coupon_savings'),
      gross: req.param('p_sale_gross'),
      tax: req.param('p_tax_amount'),
      fee: req.param('p_paddle_fee')
    };
    var pretty = JSON.stringify(req.body, null, 2);

    var earningsText = req.param('p_earnings');
    if (typeof(earningsText) === 'string') {
      try {
        var earnings = JSON.parse(earningsText);
        if (earnings && earnings['128']) {
          params.earnings = earnings['128'];
        }
      } catch (e) {
        console.warn("Cannot parse earnings string");
      }
    }

    var paramKeys = Object.keys(params);
    var paramPairs = [];
    for (var i = 0; i < paramKeys.length; i++) {
      if (paramKeys[i] == 'raw') {
        continue;
      }
      paramPairs.push("" + paramKeys[i] + ": " + params[paramKeys[i]]);
    };
    var paramsText = paramPairs.join("\n");

    var priceAndCoupon = "" + params.price + " " + params.currency;
    if (params.coupon) {
      priceAndCoupon = priceAndCoupon + " (" + params.coupon + ")";
    }

    var earningsString = params.earnings + " " + params.currency;
    var grossString = params.gross + " " + params.currency + " (tax " + params.tax + " " + params.currency + ", fee " + params.fee + " " + params.currency + ")";

    model.claimLicense(ctx, params).then(function(license)  {
      if (license) {
        res.send(license.licenseCode);
      } else {
        res.send(500, 'Out of licenses');
      }

      model.countUnclaimedLicenses(ctx).then(function(unclaimedCount)  {
        var info = { STORE: 'Paddle', NAME: params.fullName, EMAIL: params.email, DATE: moment().format('ddd, MMM D, YYYY HH:mm Z'), LICENSE_CODE: license.licenseCode, TXN: params.txn, PRICE: priceAndCoupon, EARNINGS: earningsString, GROSS: grossString, UNCLAIMED: unclaimedCount, RAW: pretty, PARAMS: paramsText };
        return sendEmail({ to: 'andrey@tarantsov.com', from: 'bot@livereload.com', replyTo: params.email }, NEW_LICENSE_NOTIFICATION_EMAIL, info);
      });
    }).done();
  }));

  app.post('/licensing/callback/manual', wrap(function(ctx, req, res)  {
    if (req.param('token') !== MANUAL_TOKEN) {
      res.send(403, 'Invalid manual token');
      return;
    }

    var params = {
      store: 'manual',
      txn: '',
      firstName: req.param('first'),
      lastName: req.param('last'),
      fullName: req.param('name'),
      message: req.param('message'),
      email: req.param('email'),
      notes: req.param('notes') || '',
    };

    model.claimLicense(ctx, params).then(function(license)  {
      if (license) {
        res.send(license.licenseCode);
      } else {
        res.send(500, 'Out of licenses');
      }

      model.countUnclaimedLicenses(ctx).then(function(unclaimedCount)  {
        var info = { STORE: 'Manual', NAME: params.fullName || (params.firstName + ' ' + params.lastName), EMAIL: params.email, DATE: moment().format('ddd, MMM D, YYYY HH:mm Z'), LICENSE_CODE: license.licenseCode, TXN: params.txn, UNCLAIMED: unclaimedCount };
        return sendEmail({ to: 'andrey@tarantsov.com', from: 'bot@livereload.com', replyTo: params.email }, NEW_LICENSE_NOTIFICATION_EMAIL, info);
      });
    }).done();
  }));

  var NEW_BETA_SIGNUP_EMAIL = require('fs').readFileSync(__dirname + '/../views/emails/beta-signup.txt', 'utf8');
  app.post('/api/v1/beta-signup/', wrap(function(ctx, req, res)  {
    var params = {
      appPlatform: (req.param('appPlatform') || '').trim(),
      appVersion: (req.param('appVersion') || '').trim(),
      name: (req.param('name') || '').trim(),
      email: (req.param('email') || '').trim(),
      about: (req.param('about') || '').trim()
    };

    if (params.name == '')
      return res.send(400, { error: 'EREQ', message: 'Missing name parameter' });
    if (params.email == '')
      return res.send(400, { error: 'EREQ', message: 'Missing email parameter' });
    if (params.appPlatform == '')
      return res.send(400, { error: 'EREQ', message: 'Missing appPlatform parameter' });
    if (!params.appPlatform.match(/^mac|windows$/))
      return res.send(400, { error: 'EREQ', message: 'Invalid appPlatform parameter' });
    if (params.appVersion == '')
      return res.send(400, { error: 'EREQ', message: 'Missing appVersion parameter' });
    if (!params.appVersion.match(/^\d+\.\d+\.\d+$/))
      return res.send(400, { error: 'EREQ', message: 'Invalid appVersion parameter' });

    model.recordBetaSignup(ctx, params).then(function(signUpRecord)  {
      res.send({ ok: 'ok' });

      var info = { RECORD_ID: ''+signUpRecord.id, NAME: params.name, EMAIL: params.email, DATE: moment().format('ddd, MMM D, YYYY HH:mm Z'), ABOUT: params.about, APP_VERSION: params.appVersion, APP_PLATFORM: params.appPlatform };
      return sendEmail({ to: 'andrey@tarantsov.com', from: 'bot@livereload.com', replyTo: params.email }, NEW_BETA_SIGNUP_EMAIL, info);
    }).done();
  }));
}

function stringOrNull(value) {
  var string = "" + value;
  if (string.length == 0) {
    return null;
  } else {
    return string;
  }
}
