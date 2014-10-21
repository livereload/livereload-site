---
title: What can LiveReload do?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86270
---

LiveReload 2 has a very simple goal: to take away the pains of web development. It packs a lot of tiny features to make that happen:

* it works with mobile devices and their simulators (if you use {% ref browser/script-tag: our JavaScript snippet %}); Adobe Shadow team has even [featured Shadow+LiveReload workflow](http://blogs.adobe.com/shadow/2012/04/24/shadow-livereload-workflow/) on their blog, and then posted [this awesome video demo](http://blogs.adobe.com/cantrell/archives/2012/05/a-complete-tour-of-adobe-shadow-in-10-minutes-including-integration-with-livereload.html)

* it works with virtually every web language and framework, supporting complex stuff like CSS @imports; v2.3.9+ adds support for the popular prefix-free JS library

* it provides a smooth workflow when your site is running on a remote server {% ref remote: if you use one of the supported approaches %}; it even has a simple built-in web server to serve modified CSS files without waiting for them to get uploaded, as part of the URL override feature

* you can even {% ref remote/preview-live: preview your CSS changes against a live site without uploading anything %}
