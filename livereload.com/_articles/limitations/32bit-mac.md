---
title: 32-bit Mac support
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86274
---

LiveReload does not support 32-bit Macs. As a rule of thumb, if you cannot install OS X Lion or later, you also cannot run the latest LiveReload.

**However,** by a popular demand, we've been able to build an older version (2.0α6) for 32-bit architecture.

Unfortunately, the latest versions of Chrome and Firefox have changed the web socket protocol, and the 32-bit version cannot talk to them.

The options you have are:

* using Safari, which should work

* using an older version of Firefox (or Chrome)

Before I give you the download link, here are some usage terms:

* You are only allowed to run this on 32-bit machines. When you upgrade, please buy the latest version. (Nothing will prevent you from running it technically, though.

* Node.js-based compilers (LESS, Stylus, Jade, CoffeeScript, Eco) won't work, because the bundled version of Node.js is 64-bit; however, if you replace 'Resources/node' executable within the app bundle with an appropriate 32-bit version, it has a good chance of working.

* We officially wish you a new Mac for Christmas.

**Download here:** [LiveReload-2.0a6-32bit-unsupported.zip](http://download.livereload.com/LiveReload-2.0a6-32bit-unsupported.zip)
