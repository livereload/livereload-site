---
title: Using custom scripts to support other editors
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86165
---

If your favorite editor is not supported by LiveReload, and you know how to make it open a specific file (on a specific line) from the command line, you can easily support it by writing a shell script and saving it as `~/.livereload/edit`.

The first (required) command-line argument will be the file name. The second (optional) argument is the line number. The second argument will be omitted in certain cases.

You can put `LR-editor-name: "SomeName"` anywhere in your script (presumably in a comment) to specify the name LiveReload should use in the UI to refer to this editor.

Here's an example script to support TextMate:

    #! /bin/bash
    # LR-editor-name: "MyMate"
    open "txmt://open/?url=file://$1&amp;line=$2"

If you made a useful script, we encourage you to send it to support@livereload.com so that we can add native support for that editor in the next release.

Don't forget to make your script executable (`chmod +x ~/.livereload/edit`).