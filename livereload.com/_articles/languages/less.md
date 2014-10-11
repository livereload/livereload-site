---
title: LESS
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86170
---

(Also see our [article on choosing a CSS preprocessor language](http://go.livereload.com/csspreproc) if you're not sure which one is for you.)

There are two ways to use LESS:

1.  You can compile LESS into CSS inside the browser.
2.  You can compile LESS into CSS and serve compiled CSS to the browser.

## Compiling LESS inside the browser

This is probably the easiest mode to get started. To compile LESS into CSS directly inside the browser, use code like this:

    &lt;link rel="stylesheet/less" href="mystyles.less"&gt;
    &lt;script src="http://lesscss.googlecode.com/files/less-1.1.3.min.js"&gt;&lt;/script&gt;

For live reloading, you have two options:

*   LESS.js has LiveReload-like mode built in (actually, more live.js-like than LiveReload-like, but I digress): if you append `#!watch` to the URL, LESS will be reloading all stylesheets every 1.5 seconds

*   or you can use the real LiveReload app, which will reload stylesheets immediately on change without waiting for 1.5 seconds (and also reload images, and maybe do more useful stuff).

## Compiling LESS ahead of time

LiveReload can compile LESS for you (if you enable it in project settings), or your web framework may be compiling LESS for you, or you can run `lessc` manually.