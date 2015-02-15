---
title: Using CSS/JS preprocessors with remote workflows
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86283
---

Here's how CSS/JS preprocessors like SASS, LESS, CoffeeScript etc and {% ref remote: remote server workflows %} fit together.

## CSS preprocessors

LiveReload only compiles files locally, so you need to figure a way to upload the resulting compiled files. Some day LiveReload will learn to handle SFTP, but for now, you will either need to tell Coda/Espresso/Transmit to upload the changes, or use something like Sublime SFTP plugins's monitoring function to upload compiled files automatically.

Luckily, you don't need to do this on every CSS change because LiveReload has an ‘override’ function. So your workflow looks like this:

1. Create SASS/LESS files for the first time, upload compiled CSS.
2. Open the page in the browser.
3. Change SASS, see the change immediately
4. Change SASS, see the change immediately
5. Repeat until satisfied.
6. Upload the compiled CSS

This is moderately painful, but still a vast improvement on anything you could do without LiveReload.

## JS and HTML preprocessors (CoffeeScript, HAML etc)

When using this, it may be painful: LiveReload only compiles files locally, and it's up to you to figure a way to upload the resulting compiled files. So far, the best tool for the job is Sublime Text 2's [SFTP plugin](http://wbond.net/sublime_packages/sftp), which has a monitoring option.
