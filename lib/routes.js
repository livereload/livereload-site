var wrap = (getConfig = require('pine2e')).wrap, getConfig = getConfig.getConfig;
var model = require('./model');

var STACK_SOCIAL_TOKEN = getConfig('STACK_SOCIAL_TOKEN');

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
    }).done();
  }));
}
