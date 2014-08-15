var wrap = (getConfig = require('pine2e')).wrap, getConfig = getConfig.getConfig;
var model = require('./model');
var sendEmail = require('./email');

var moment = require('moment');
var STACK_SOCIAL_TOKEN = getConfig('STACK_SOCIAL_TOKEN');
var NEW_LICENSE_NOTIFICATION_EMAIL = require('fs').readFileSync(__dirname + '/../views/emails/license-notification.txt', 'utf8');

module.exports = function(app) {
  app.get('/', function(req, res)  {
    res.render('home');
  })

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
        var info = { STORE: 'StackSocial', NAME: params.firstName + ' ' + params.lastName, EMAIL: params.email, DATE: moment().format('ddd, MMM D, YYYY HH:mm Z'), LICENSE_CODE: license.licenseCode, TXN: '94387538747534875', UNCLAIMED: unclaimedCount };
        return sendEmail({ to: 'andrey@tarantsov.com', from: 'bot@livereload.com' }, NEW_LICENSE_NOTIFICATION_EMAIL, info);
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
