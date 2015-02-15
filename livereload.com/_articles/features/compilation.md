---
title: Compilation
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86276
---

LiveReload can compile LESS, SASS, Compass, CoffeeScript, Jade and others into corresponding css/js/html files.

The following compilers are currently supported:

*   Compiled into CSS: SASS/Compass, LESS, Stylus.
*   Compiled into JavaScript: CoffeeScript, Eco.
*   Compiled into HTML: Jade, HAML, Slim.

Internally we're using a plugin-like model, and you can easily add support for additional languages if you're adventurous enough (look at `*.lrplugin/Info.plist` inside the app bundle). There is no official plugin API yet, however (we need to figure out both technical and App Store policy details).
