---
title: Rails
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86278
---

LiveReload works wonders with any version of Rails.

Rails 3 handles all assets compilation itself (via Sprockets), which means you should NOT enable compilation in LiveReload. Just add your Rails project to LiveReload and boom, you get your live reloading.

If you're using Rails 2 and want LiveReload to handle asset compilation, go ahead and enable it.