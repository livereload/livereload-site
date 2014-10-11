---
title: LiveReload has problems with SSL (https)
locations:
  - http://feedback.livereload.com/knowledgebase/articles/95691
---

LiveReload works by injecting livereload.js script into your web pages. The script has a URL like http://localhost:35729/livereload.js; on https pages that triggers an “insecure content warning” or a similar message from your browser.

**Workaround:** You should be able to configure your browser to suppress the warnings. Google for your browser name and “mixed mode warnings” (or the exact error message).

**Vote to fix this problem** on [its feedback entry here](http://feedback.livereload.com/forums/157942-general/suggestions/2988007-fix-livereload-to-work-with-https)&nbsp;— non-anonymous voters get subscribed to the updates.

**Status:** I'm planning to look into it some time soon, but for now, please consider this a limitation.

(The main problem is that&nbsp;livereload.js can be accessed via multiple domain names, and even when it's on localhost, there's no way to obtain a trusted SSL certificate for localhost. I do have a few options in mind, though.)