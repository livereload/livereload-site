---
title: How do I add the SCRIPT tag manually?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86180
---

You can add a piece of JavaScript to your page instead of using
browser extensions. This is nice if:

*   you want to test in unsupported browsers (although it does
  not work in IE yet, so this point is moot)
*   you want to test on iPhone devices/simulators
*   you want to use LiveReload on file: URLs in Safari (and don't
  want to switch to Chrome)
*   you just don't feel like using the extensions

If your web site is running locally (on the same computer as
LiveReload app), grab the default snippet displayed in the main
LiveReload window. It looks like this:

<pre>`&lt;script&gt;document.write('&lt;script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"&gt;&lt;/' + 'script&gt;')&lt;/script&gt;`
</pre>

If your web site is running on another server, you need to specify the IP address of your local computer instead:
<pre>&lt;script src="http://192.168.0.1:35729/livereload.js?snipver=1"&gt;&lt;/script&gt;</pre>