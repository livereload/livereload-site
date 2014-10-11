---
title: "Failed to start: port occupied"
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86181
---

![](http://assets.livereload.com/failed-to-start-port-occupied.png)

LiveReload uses TCP port 35729 to communicate with its browser extensions. This error means that another application on your computer has already taken this port.

Possible causes below.

## Cause 1: You have an alternative server like guard-livereload running

All of the following tools are not compatible with LiveReload 2:

*   guard-livereload
*   rack-livereload
*   livereload plugin for Sublime Text

There is no need to completely remove them, just be sure to not run LiveReload 2 and those tools at the same time.

## Cause 2: Another logged in user on your computer is using LiveReload

If you use fast user switching, please keep in mind that only one user can run LiveReload at the same time.

## Cause 3: Another app is using the port for an unrelated reason

On a Mac, please run the following command in the Terminal:

    lsof -iTCP:35729
    `</pre>

    On Windows, please execute the following command from cmd.exe:

    <pre>`netstat -ab | findstr 35729

If it outputs nothing, then the port is unused. Otherwise, it gives you the name of the app which uses the port; if you quit that app, LiveReload should work (and the app will likely use another port the next time you run it).

If that hasn't resolved your problem, please open a new support ticket and we'll help!
