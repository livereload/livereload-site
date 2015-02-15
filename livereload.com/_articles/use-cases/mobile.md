---
title: How do I use LiveReload on iPhone/iPad/Android/etc?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86232
---

LiveReload works with iOS devices out of the box if you add a correct SCRIPT tag (there are no browser extensions on mobile devices).

When your site is running **on your local computer** (i.e. on the same one that runs LiveReload app), the default script tag is fine.

When your site is running **on another server** (or if you're not sure which one is the case), you need to explicitly specify the IP of your local computer:

    <script src="http://192.168.0.1:35729/livereload.js?snipver=1"></script>

**You should be all set now!** Open your site on iPhone, iPod Touch, iPad or on iOS Simulator, and live reloading should work just like it does in desktop browsers.

Adobe Shadow team has [a great walk-through on their blog](http://blogs.adobe.com/shadow/2012/04/24/shadow-livereload-workflow/).

**Android support?** Should work with the Chrome browser on the modern versions of Android.
