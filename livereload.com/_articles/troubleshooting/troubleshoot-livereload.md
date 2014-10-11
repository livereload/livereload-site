---
title:  How do I troubleshoot LiveReload?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86294
---

Please watch out for these common problems:

*   Cannot find the app on a Mac? By default it lives in your menu bar on 10.7 and in
your dock on 10.6.

*   Using prefixfree JavaScript library (e.g. as part of HTML5 boilerplate)? Please
[upgrade to the
latest beta version](http://go.livereload.com/intro).

*   Using a proxy server? Be sure to configure 127.0.0.1 to bypass the proxy.

Some common problems with browser extensions:

*   Make sure you've activated the extension by clicking its toolbar button on the desired page.
*   Chrome and Safari extensions can only access pages loaded after the extension installation/update. Try reopening your tabs or restarting the browser if you have a problem with extensions.

*   Safari extension does not have access to file: URLs. There is no way around it; the best solution is to use Chrome.

Otherwise, please contact support and provide the following information.

**Part 1.** Simple details:

*   the version of your operating system

*   the version of the LiveReload app

*   which browsers you have tried it with

*   the versions of those browsers

*   the versions of installed LiveReload browser extensions, if any

*   the URL you use to access your project locally

*   the details of your web stack (e.g. PHP 5.3 with MAMP, or Rails+Pow, or webapp2 on
Google App Engine, etc)

**Part 2.** Please attach the log file.

  On a Mac:

<pre>`~/Library/Application Support/LiveReload/Log`
</pre>

  On Windows XP:

<pre>C:\Documents and Settings\YourUserName\Local Settings\Application Data\LiveReload\Logs\log.txt</pre>

On Windows Vista / 7:

<pre>C:\Users\YourUserName\Local Settings\Application Data\LiveReload\Logs\log.txt</pre>

**Part 3.** If your problems are connection-related, please append `?LR-verbose` to the browser URL and give me any LiveReload-related output from the browser's JavaScript console.

  **Part 4 (Mac only).** Please attach the crash log files if the app has ever crashed. They are located here:

<pre>~/Library/Logs/CrashReporter</pre>

  The file names should start with
  `LiveReload` and end with `.crash`