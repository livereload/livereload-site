---
title: Hidden preferences
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86169
---

LiveReload has some hidden preferences you can configure with `defaults write` command in Terminal.

**You MUST restart LiveReload for hidden preference changes to take effect.**

## Emacs temp files

Normally LiveReload ignores files starting with `#` or ending with `~`. You can disable this, so that LiveReload will monitor these files like any other ones, by running:

    defaults write com.livereload.LiveReload DontIgnoreEmacsTempFiles -bool YES
    `</pre>

    Revert to default:

    <pre>`defaults delete com.livereload.LiveReload DontIgnoreEmacsTempFiles
    