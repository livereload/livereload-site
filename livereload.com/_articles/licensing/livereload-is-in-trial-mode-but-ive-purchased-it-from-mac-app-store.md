---
title: LiveReload is in trial mode, but I've purchased it from the Mac App Store
locations:
  - http://feedback.livereload.com/knowledgebase/articles/113952
---

**First things first:** LiveReload downloaded from the Mac App Store will never say it's a trial version. If the version published on the Mac App Store suits your needs, just delete the app you have and re-download it from the Mac App Store.

**Still here? OK, second:** LiveReload downloaded from our site&nbsp;_should_ recognize your Mac App Store license and run without the ‘free trial’ message.

There's a catch, however:&nbsp;<span style="background-color: rgb(255, 255, 255); font-size: 14px; line-height: 19px; ">you must have installed and launched LiveReload 2.2+ from the Mac App Store on that computer at least once</span>.
> Why? Apple does not provide any APIs to check for existence of the Mac App Store license from an external app; they only store the license file inside the apps downloaded from the Mac App Store. So we do a trick: Mac App Store versions of LiveReload, starting with version 2.2, stash away that file into a Library folder on your computer. When you later launch a non-Mac App Store version of LiveReload, it can find that file and verify the license.

So here's how you fix the problem:

1.  Delete LiveReload app.
2.  Install the latest version from Mac App Store.
3.  Run it once (it will save the license file into a proper location), then quit.
4.  Download and install [the latest version from our site](http://go.livereload.com/mac).

**If that does not help,** please contact support and we'll help you sort it out.