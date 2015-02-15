---
title: If you edit remote files using Open With in Transmit
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86258
---

This is an experimental mode, so let me know if it works for you:

1.  Please add the following folder to LiveReload:

        ~/Library/Caches/Cleanup At Startup/Transmit

    (protip: after opening a file via Transmit, Command-click the file name in the title bar of your editor to quickly get to that folder)

2.  To have LiveReload wait for the upload to finish before reloading the page, enable “Wait X seconds before doing a full page reload”, with X slightly more than your usual upload time (I use 1.5 seconds).

3.  Waiting sucks when you are editing CSS, though. This is where “Override URLs to serve modified CSS from localhost” comes into play. LiveReload will do some magic to show you the changes instantly on save.

4.  If the magic runs dry, i.e. this experimental new “CSS override” mode does not work for you, be sure to open a support ticket. But then you can disable both of the above options, and enable the catch-all “Wait X seconds before processing any changes”. It will of course mean that you'll have to wait for every CSS change to upload before you can see it.

You cannot use SASS/LESS/CoffeeScript/etc with this workflow. See {% ref remote: an overview of remote workflows %} for other options.
