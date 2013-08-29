var express = require('express');
var http = require('http');
var path = require('path');
var useragent = require('express-useragent');

var general = require('./routes/general');
var support = require('./routes/support');

var app = express();

// web services
global.postmark = require("postmark")(process.env.POSTMARK_API_KEY)

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(useragent.express());
app.use(app.router);
// app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

app.get('/', general.index);
app.all('/support/submit', support.submit);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
