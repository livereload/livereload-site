---
title: Imported Files (Partials) Support
draft: true
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86253
---

LiveReload supports imported files (partials) in LESS, SASS and Stylus. Imported files are never compiled by themselves. When you change an imported file, LiveReload compiles the “main” file (or files) instead.

For now, LiveReload matches imported files by file name, ignoring the path. Thus if you `@import /some/path/foo.less`, and also have another `foo.less` somewhere in your project, LiveReload will incorrectly treat your `foo.less` as imported. Let us know if that actually happens for you!

For SASS, LiveReload understands the underscore convention when searching for imported files. It won't, however, automatically treat any file starting with an underscore as a partial. You have to actually import it somewhere for LiveReload to consider it a partial.