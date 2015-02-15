---
title: How does LiveReload talk to my browsers?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/87992
---

To communicate with your browsers, LiveReloads needs its JavaScript code to be injected into your web pages. The code then connects back to the LiveReload app and waits for instructions like “reload css/styles.css”.

While LiveReload app is running, you can see the code by opening `http://localhost:35729/livereload.js` in your browser. (The original source code for the script is [available on GitHub](https://github.com/livereload/livereload-js).) LiveReload app handles all requests to port 35729 on the computer it runs on. Besides serving the script, this port is also used to communicate with the script over web sockets.
