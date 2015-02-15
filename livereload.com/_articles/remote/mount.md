---
title: If you mount your site as disk using Transmit, ExpanDrive, sshfs, etc
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86272
---

Please configure LiveReload 2 as follows:

1.  To have LiveReload wait for the upload to finish before reloading the page, enable “Wait X seconds before doing a full page reload”, with X slightly more than your usual upload time (I use 1.5 seconds).

2.  Waiting sucks when you are editing CSS, though. This is where “Override URLs to serve modified CSS from localhost” comes into play. LiveReload will do some magic to show you the changes instantly on save.

3.  If the magic runs dry, i.e. this experimental new “CSS override” mode does not work for you, be sure to open a support ticket. But then you can disable both of the above options, and enable the catch-all “Wait X seconds before processing any changes”. It will of course mean that you'll have to wait for every CSS change to upload before you can see it.

SASS/LESS/CoffeeScript/etc will work out of the box with this scenario.

See {% ref remote: an overview of other remote workflows %}.
