---
title: Using custom compiler versions
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86281
---

A friendly UI for choosing versions of your SASS, LESS etc preprocessors is coming. Meanwhile, here are your options of using a version different from the one shipped with LiveReload:

**Option 1.** Try [the latest beta version](http://go.livereload.com/beta) — it usually contains the latest released (aka stable) versions of all preprocessors.

**Option 2.** Inside LiveReload.app bundle, delete all gems under e.g. `Resources/SASS.lrplugin/lib/`; deleting bundled gems will force LiveReload to use the gems from your system. (If you are using RVM, be sure that the correct version of Ruby is specified in Compilation Settings.)

**Option 3.** Instead of deleting the gems, you can update them to the latest versions. Optionally, before customizing it, you may copy SASS.lrplugin into `~/Library/LiveReload/Plugins` so that your custom version will survive LiveReload updates.