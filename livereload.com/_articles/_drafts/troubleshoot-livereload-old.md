---
title: How do I troubleshoot LiveReload? (OLD)
draft: true
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86191
---

So you have followed installation instructions, but LiveReload does not do anything when you change a file? Please check what LiveReload main window says at the bottom.

*   If it says “Safari: right-click…, Chome: click…”, your browser is NOT connected to LiveReload app, and you need to troubleshoot connection problems (see below).

*   If it says “0 changes detected”, your browser IS connected, however LiveReload is not detecting any changes. You need to troubleshoot filesystem monitoring problems (see below).

*   If it says “N changes detected” (N &gt; 0), your browser IS connected and LiveReload is processing changes. You need to troubleshoot reloading problems (see below).

## Troubleshooting Connection Problems

Please check the following:

1.  Have you either added a SCRIPT snippet to your code, or installed LiveReload browser extensions? Either of those is required to communicate with the browser.

2.  If you are using browser extensions, have you enabled them? In Safari, you need to right-click on the page and choose “Enable LiveReload”. In Chrome and Firefox, you need to click the toolbar button.

3.  Does your system or browser have proxies configured? If so, it might be trying to make a web socket connection over a proxy server, and thus not reaching LiveReload. Try disabling the proxies, or adding localhost to the list of local hosts.

4.  Are your browser, web server and LiveReload app all running on the same computer? Web server and LiveReload app have to be on the same computer. You may use web browser on other devices if you add a SCRIPT snippet to your HTML code.

If nothing helps, please contact support.

## Troubleshooting File System Monitoring Problems

There are two reasons why LR might not detect changes:

1.  Are there any symlinks involved? File system change notifications do not cross symlink boundaries, so you need to be monitoring exactly the folder that you will be changing files in, or any of its real parent folders. If you are monitoring `/foo/bar`, and you change a file in `/foo/bar/boz/filez/`, and `/foo/bar/boz` is a symlink, the change will not be detected.

2.  A (relatively rare) OS bug, present in both 10.6 and 10.7, which causes FSEvents to stop reporting changes for some specific folders. LiveReload detects this bug and warns the user. See [more details in another article](http://help.livereload.com/kb/troubleshooting/os-x-fsevents-bug-may-prevent-monitoring-of-certain-folders).

## Troubleshooting Reloading Problems

If browser successfully connects to LiveReload, and the app is detecting changes, but:

*   nothing happens in your browser, or
*   your browser correctly reloads when you change html/php/etc, but does nothing when you change CSS,

please check the following:

1.  Is your page using file: or https: URLs? Those are not currently supported. They will be supported in the next version. If you were trying to use file:, please see [workarounds for working with local files](http://help.livereload.com/kb/general-use/working-with-local-files-file-urls).

2.  If nothing happens when you change CSS, are you using @import? @import is not presently supported, but will be supported in one of the next versions. Sorry. If you're using Drupal 7, there's [LiveReload module](http://drupal.org/project/livereload) which makes Drupal use multiple LINK tags instead of @import's.

3.  If nothing happens when you change LESS/SASS/CoffeeScript/etc, please check if you have configured compiler modes correctly. If you are using “on-the-fly” mode, please try “ignore” mode instead.

Otherwise, please contact support and describe your web project in detail (technology / server stack, the way you include stylesheets, anything unusual).