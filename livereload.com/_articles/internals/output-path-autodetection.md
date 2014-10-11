---
title: Output path autodetection
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86166
---

(This article is about output paths of compilers like SASS and CoffeeScript. If you're not using compilation feature of LiveReload, it does not apply to you.)

When you add an existing project to LiveReload, it tries to be smart about auto-detecting your existing output path rules. Namely, in version 2.3.7+, the rules are as follows (with .less and .css as examples of a source and output extensions):

*   for a file foo/bar/boz.less, if there's boz.css in the same folder, it is used
*   otherwise, if there's exactly one “unclaimed” boz.css anywhere else in the project, it is used (“unclaimed” means that no other .less file has that boz.css set as its output path)
*   otherwise, if boz.less's parent folder has one of the predefined names (like “css”, “styles”, “stylesheets” — the actual names depend on the compiler), boz.css is created in that directory
*   otherwise, if one of boz.less's ancestor folders has a subfolder with one of the predefined names (like “css”, “styles”, “stylesheets”), boz.css is created in that subfolder
*   otherwise, boz.css is created in the same folder as boz.less