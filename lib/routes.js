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
}
