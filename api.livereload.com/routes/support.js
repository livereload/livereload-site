var DetailFields = ['subject', 'category', 'problem', 'urgency', 'weblanguage', 'webframework', 'platform', 'product'];
var DetailFieldLabels = {
  'subject': 'Subject',
  'category': 'Category',
  'problem': 'Problem',
  'urgency': 'Urgency',
  'weblanguage': 'Web-Language',
  'webframework': 'Web-Framework',
  'platform': 'Platform',
  'product': 'Product'
};

exports.submit = function(req, res) {
  var details = req.body;
  if (!details.email && req.query.email)
    details = req.query;

  var name = details.name || 'User';
  var email = details.email || '';
  var subject = details.subject || '';
  var product = details.product || '';
  var message = details.body || ''; delete details.body;
  var category = details.category || '';
  var problem = details.problem || '';
  var urgency = details.urgency || '';

  if (!email) {
    res.jsonp({ ok: false, code: 'EINVALID', field: 'email', message: "Missing a required field" });
    return;
  }

  var ticketId = '' + (1000 + Math.floor(Math.random() * 1000));

  var subjectItems = [];
  subjectItems.push('Ticket #' + ticketId);

  if (urgency === 'urgent')
    subjectItems.push('[URGENT]');
  else if (urgency != 'week')
    subjectItems.push('[' + urgency + ']');

  if (product && product !== 'livereload-app')
    subjectItems.push(product + ':');

  if (category === 'problem')
    subjectItems.push('[pr]');
  else if (category === 'feature-request')
    subjectItems.push('[feature]');
  else if (category)
    subjectItems.push('[' + category + ']');

  if (problem && problem !== 'other')
    subjectItems.push('[' + problem + ']');

  subjectItems.push(subject);

  var subject = subjectItems.join(' ');

  var detailItems = [];
  detailItems.push(['From', name + ' <' + email + '>']);
  DetailFields.forEach(function(field) {
    if (details[field]) {
      detailItems.push([DetailFieldLabels[field] || field, details[field]]);
    }
  });
  for (var field in details) if (details.hasOwnProperty(field)) {
    if (field === 'callback' || field === '_')
      continue;  // JSONP and jQuery cache busting
    if (field === 'name' || field === 'email')
      continue;  // handled separately
    if (DetailFields.indexOf(field) === -1) {
      detailItems.push([DetailFieldLabels[field] || field, details[field]]);
    }
  }

  detailItems.push(['User-Agent', req.useragent.source]);
  detailItems.push(['Detected-Browser', req.useragent.Browser + ' ' + req.useragent.Version]);
  detailItems.push(['Detected-OS', req.useragent.OS]);

  var detailRows = [];
  detailItems.forEach(function(item) {
    detailRows.push(item[0] + ": " + item[1] + "\n");
  });

  var body = message + "\n\n---\n\n" + detailRows.join('');

  var userBody = "Your ticket has been emailed to Andrey Tarantsov; here's a copy for your convenience. (You can reply to add more details as well.)\n\n---\n\n" + body;

  postmark.send({
    To: "LiveReload Support <support@livereload.com>",
    From: name + " <support@livereload.com>",
    ReplyTo: name + " <" + email + ">",
    Subject: subject,
    TextBody: body
  }, function(error, success) {
    if (error) {
      res.jsonp({ ok: false, message: error.message });
    } else {
      postmark.send({
        To: name + " <" + email + ">",
        From: name + " <support@livereload.com>",
        ReplyTo: "LiveReload Support <support@livereload.com>",
        Subject: subject,
        TextBody: userBody
      }, function(error, success) {
        if (error) {
          res.jsonp({ ok: true, userOk: false, message: error.message });
        } else {
          res.jsonp({ ok: true, userOk: true });
        }
      });
    }
  })
};
