---
title: "HAML: Unicode problems"
locations:
  - http://feedback.livereload.com/knowledgebase/articles/85895
---

If your HAML chokes on Unicode characters (within or outside LiveReload), you might want to add the following line to the top of your Unicode files:
<pre>-# coding: utf-8</pre>

This should only happen when using Ruby 1.9 configured through Compilation Options. [The line is documented here](http://haml.info/docs/yardoc/file.HAML_REFERENCE.html#encodings).

This problems seems to occur for some people but not others. In particular, it does not occur for me, so I don't really understand what happens here. If you can shed some light on it, please give me a note!
