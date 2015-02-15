---
title: If you edit the sources locally and sync on save via Coda, Espresso, Sublime SFTP plugin
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86240
---

Please configure LiveReload 2 as follows:

1. To have LiveReload wait for the upload to finish before reloading the page, enable “Wait X seconds before doing a full page reload”, with X slightly more than your usual upload time (I use 1.5 seconds).

2. Waiting sucks when you are editing CSS, though. This is where “Override URLs to serve modified CSS from localhost” comes into play. LiveReload will do some magic to show you the changes instantly on save.

3. If the magic runs dry, i.e. this experimental new “CSS override” mode does not work for you, be sure to open a support ticket. But then you can disable both of the above options, and enable the catch-all “Wait X seconds before processing any changes”. It will of course mean that you'll have to wait for every CSS change to upload before you can see it.

If you also want to use SASS/LESS/CoffeeScript/etc, please see “{% ref remote/compilers %}”.

{% ref remote: An overview of other remote workflows %}
