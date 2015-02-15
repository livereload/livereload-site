---
title: ExpressionEngine
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86268
---

LiveReload works great with ExpressionEngine when editing templates saved as files. For example, in the sample theme agile_records, you need to save site_css template from global_embeds group into a file.

(If you're not familiar with saving templates as files, here's a one-paragraph description: go to Template Management > Global Template Preferences, enable “Allow Templates to be Saved as Files” and specify a suitable empty folder as “Basepath to Template File Directory”. Then edit the templates you want to be saved, enable “Save Template as File” and click Update. Now, instead of editing the template via EE web panel, you can edit the local file. Point LiveReload to the folder containing these local files, and live reloading will work. [More info here](http://expressionengine.com/user_guide/templates/templates_as_files.html).)
