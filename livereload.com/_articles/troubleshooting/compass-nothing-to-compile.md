---
title: "Compass: “Nothing to compile”"
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86266
---

First: this message means LiveReload is compiling your SASS code via Compass. If this is what you intended, marvelous. If you were trying to use pure SASS without Compass and get this message, something is seriously screwed up — please [contact us](http://help.livereload.com/discussion/new) for more help.

## Did you create a Compass project?

In case you are new to Compass, you cannot simply add

    @import 'compass/something'

into your SASS file and expect it to work; Compass requires a certain project structure and config files.

Generally, you want to run `compass create .` in your directory to create a new project. However there are several options along the way, so we encourage you to [read the official tutorial about that](http://compass-style.org/help/tutorials/command-line/).

Please restart LiveReload to pick up a change in the type of your project. I will fix the need to restart after releasing 2.0.

## So, you have a Compass project, but compilation not work?

LiveReload Compass support requires you to add your **root Compass directory** to LiveReload. To put it another way, it must be possible to run 'compass' without arguments in the directory you add to LiveReload.

Normally, this is not an issue, but if you have been previously using [Compass app](http://compass.handlino.com/), you may have your Compass project in a compass/ subdirectory. In this case, you need to add compass/ subdirectory to LiveReload.

If this explanation does not resolve your problem, please [create a new discussion](http://help.livereload.com/discussion/new) and let us know!
