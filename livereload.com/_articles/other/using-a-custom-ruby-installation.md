---
title: Using a custom Ruby installation
locations:
  - http://feedback.livereload.com/knowledgebase/articles/155806
---

Currently, LiveReload only understands `/usr/bin/ruby` and RVM rubies in `~/.rvm/rubies/`, so there is no way to add a non-RVM Ruby installation directly.

There is a workaround, though: you can use RVM to ‘mount’ your existing Ruby installations into RVM directories, after which LiveReload will be able to see and use them.

It works like this:

1) [Install RVM](http://rvm.io/) if you don't already have one.

2) Use `rvm automount` command to add (‘mount’) existing Ruby installations from $PATH.

After that, you'll be able to use your existing rubies in LiveReload.