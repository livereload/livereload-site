---
title: Plugin API
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86264
---

LiveReload plugin API is documented in [livereload/livereload-plugins](https://github.com/livereload/livereload-plugins) on GitHub.

## An example

Let's make a simple Node.js-based compiler for a fictional language “More Is Less”, which compiles .more files into .css files.

Put MoreIsLess.lrplugin with the two files listed below into `~/Library/LiveReload/Plugins` and restart LiveReload. It should now list MoreIsLess among the available compilers and, if you turn compilation on, will invoke our script to turn .more files into .css files.

MoreIsLess.lrplugin/manifest.json:

    {
      "LRCompilers": [
        {
          "Name": "MoreIsLess",
          "Extensions": ["more"],
          "DestinationExtension": "css",
          "CommandLine": [
            "$(node)",
            "$(plugin)/more.js",
            "$(additional)",
            "$(src_path)",
            "$(dst_path)"
          ]
        }
      ]
    }
    `</pre>

    MoreIsLess.lrplugin/more.js:

    <pre>`var fs = require('fs');
    var sourceFile = process.argv[2];
    var outputFile = process.argv[3];
    var source = fs.readFileSync(sourceFile, 'utf8');
    source = source.replace(/more/g, 'less');
    fs.writeFileSync(outputFile, source);
    