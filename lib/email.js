var getConfig = (when = require('pine2e')).getConfig, when = when.when;
var subst = require('subst');
var debug = require('debug')('p2e:email');

var apiKey = getConfig('POSTMARK_API_KEY');
var postmark = require('postmark')(apiKey);
var postmarkSend = when.node.lift(postmark.send);

module.exports = sendEmail;

function sendEmail(params, text, info) {
  var req = {};

  if (text != null) {
    if (typeof text !== 'string')
      throw new Error('sendEmail: invalid type of the second argument -- ' + typeof(text));
    var substInfo = function(s)  {return subst(s, info || {})};

    var meta = parsePrelude(text);
    if (meta.Subject) {
      params.subject = substInfo(meta.Subject);
    }
    if (meta.text) {
      params.text = substInfo(meta.text);
    }
  }

  if (params.to)
    req.To = formatAddressList(params.to);

  if (params.cc)
    req.Cc = formatAddressList(params.cc);

  if (params.bcc)
    req.Bcc = formatAddressList(params.bcc);

  if (params.from)
    req.From = formatAddress(params.from);

  if (params.replyTo)
    req.ReplyTo = formatAddress(params.replyTo);

  if (params.subject)
    req.Subject = params.subject;

  if (params.text)
    req.TextBody = params.text;

  if (params.html)
    req.HtmlBody = params.html;

  return when.promise(function(resolve, reject)  {
    postmark.send(req, function(err)  {
      if (err) {
        debug('Failed to send email via Postmark; error = %s, email = %s', JSON.stringify(err, null, 2), JSON.stringify(req, null, 2));
      } else {
        debug('Sent email via Postmark to %s: %s', req.To, req.Subject);
        resolve();
      }
    });
  })
  return postmarkSend(req);
}

function formatAddressList(addresses) {
  if (Array.isArray(addresses)) {
    return addresses.map(formatAddress).join(', ');
  } else {
    return formatAddress(addresses);
  }
}

function formatAddress(address) {
  if (typeof address === 'string')
    return address;

  if (!address || !address.email)
    return;

  if (address.name) {
    return address.name + ' <' + address.email + '>';
  } else {
    return address.email;
  }
}

function parsePrelude(text) {
  var M = text.match(/^(\w+:.*\n)+\n/);
  if (M) {
    var meta = M[0];
    var result = { text: text.substr(meta.length) };
    while (M = meta.match(/^(\w+):(.*)\n/)) {
      result[M[1].trim()] = M[2].trim();
      meta = meta.substr(M[0].length);
    }
    return result;
  } else {
    return { text: text };
  }
}
