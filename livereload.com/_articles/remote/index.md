---
title: Overview of remote workflows
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86183
---

Workflows that work with LiveReload 2 both for plain CSS and for SASS, LESS, CoffeeScript, etc:

*   If you [edit the sources locally and sync on save](http://feedback.livereload.com/knowledgebase/articles/86240-if-you-edit-the-sources-locally-and-sync-on-save-v) via [Sublime SFTP](http://wbond.net/sublime_packages/sftp) plugin (you need to use their Monitor command for compiled files when using compilers)
*   If you [mount your site as disk](http://feedback.livereload.com/knowledgebase/articles/86272-if-you-mount-your-site-as-disk-using-transmit-exp) using Transmit, ExpanDrive, sshfs, etc
*   When working on the design, you can [preview CSS changes against a live site, then upload when done](http://feedback.livereload.com/knowledgebase/articles/86220-preview-css-changes-against-a-live-site-then-uplo)

Workflows that work with LiveReload 2 for plain CSS, but might be a little tricky when you need SASS, LESS, CoffeeScript and others (you need to upload the compiled CSS manually, although you can preview your style changes instantly while tweaking them):

*   If you [edit the sources locally and sync on save](http://feedback.livereload.com/knowledgebase/articles/86240-if-you-edit-the-sources-locally-and-sync-on-save-v) via Coda or Espresso
*   If you [edit remote files using Open With in Transmit](http://feedback.livereload.com/knowledgebase/articles/86258-if-you-edit-remote-files-using-open-with-in-transm)

Workflows that don't work with LiveReload 2 yet:

*   If you [edit files directly on your server](http://feedback.livereload.com/knowledgebase/articles/86280-if-you-edit-files-directly-on-your-server) — unless you use of of the supported workflows, you need to follow the instructions in this article to get live reloading to work using some command-line tools

If nothing LiveReload works for you, check out [the list of alternatives to LiveReload](http://feedback.livereload.com/knowledgebase/articles/86189-i-don-t-like-livereload-can-you-recommend-somethi).
