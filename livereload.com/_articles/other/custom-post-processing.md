---
title: Custom (post-)processing
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86219
---

You can run an arbitrary Terminal command each time LR detects changes (right after any applicable compilers are invoked).

The command is executed via `/bin/sh -c "your command"`, so anything you can type in Terminal works here too.

Example commands:

*   `rake`
*   `rake something`
*   `./my-script`
*   `echo $(date) &gt;&gt;log` (useless, just to illustrate the idea about sh -c being used)
*   `cat js/*.js &gt; js/concat.js` (such stuff is best put into a script, though)

The output is not displayed anywhere, so use command-line growlnotify yourself if you want it (and/or redirect output to a file). (You can still see the output using Console.app, among other LiveReload logging.)

## Grace period

Changes made by the post-processing command won't cause processing to run again to avoid an endless loop.

Because the changes may be reported with a certain delay, there's a grace period of 0.5 seconds after the post-processing command finishes. Changes made during this grace period are considered to be potentially made by the post-processing command, and won't cause processing to run again either.

The grace period can be customized in the post-processing options dialog. It cannot be set to less than 0.01 seconds.

## Substitutions

In the command, you can use the following substitutions (which are expanded before the command is fed into shell):

*   `$(ruby)` — path to system Ruby interpreter
*   `$(node)` — path to Node interpreter bundled with LiveReload
*   `$(project_dir)` — path to the project directory (which won't be of use to you, since it will be the current directory when script runs)

These substitutions probably aren't of much use at the moment. May get more useful when we get to releasing plugin API.