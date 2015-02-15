---
title: Monitoring more than 100,000 files
locations:
  - http://feedback.livereload.com/knowledgebase/articles/154257
---

## Problem

LiveReload 2 for Mac limits the total number of _monitored_ files per project. The limit has been arbitrarily set to 100,000 files by default.

(We're taking about files with whitelisted extensions here: html, js, css, php, images, sass, etc. You can see the list in Monitoring Options inside LiveReload.)

Before version 2.3.21, LiveReload would crash when hitting the limit.

Starting with version 2.3.21, when the limit is hit, you get the following message in the log; run Console.app to see it (this will NOT be displayed as an alert yet):

> WARNING: Hitting the limit on max monitored files per project. Some files will not be monitored. To increase the limit, use 'defaults write com.livereload.LiveReload MaxMonitoredFilesPerProject 500000'. Current limit is 100000.

(LiveReload for Windows does not currently limit the number of monitored files.)

## Solution

If you've hit the limit, you have two options.

First, if you don't need to monitor certain large subfolders, you can ignore them in Monitoring Options to bring the total number of monitored files under the limit.

Second, you can increase the limit by running the defaults command (from the error message) in Terminal.app, and then restarting LiveReload. For example, the following command will increase the limit to 500,000 files:

    defaults write com.livereload.LiveReload MaxMonitoredFilesPerProject 500000
