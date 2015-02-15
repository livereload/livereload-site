---
title: Overview of remote workflows
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86183
---

Workflows that work with LiveReload 2 both for plain CSS and for SASS, LESS, CoffeeScript, etc:

* {% ref remote/edit-locally-and-sync: If you edit the sources locally and sync on save %} via [Sublime SFTP](http://wbond.net/sublime_packages/sftp) plugin (you need to use their Monitor command for compiled files when using compilers)
* {% ref remote/mount: If you mount your site as disk %} using Transmit, ExpanDrive, sshfs, etc
* When working on the design, {% ref remote/preview-live: you can preview CSS changes against a live site, then upload when done %}

Workflows that work with LiveReload 2 for plain CSS, but might be a little tricky when you need SASS, LESS, CoffeeScript and others (you need to upload the compiled CSS manually, although you can preview your style changes instantly while tweaking them):

* {% ref remote/edit-locally-and-sync: If you edit the sources locally and sync on save %} via Coda or Espresso
* {% ref remote/transmit: If you edit remote files using Open With in Transmit %}

Workflows that don't work with LiveReload 2 yet:

* {% ref remote/direct-editing: If you edit files directly on your server %} — unless you use of of the supported workflows, you need to follow the instructions in this article to get live reloading to work using some command-line tools

If nothing LiveReload works for you, check out {% ref about/alternatives: the list of alternatives to LiveReload %}
