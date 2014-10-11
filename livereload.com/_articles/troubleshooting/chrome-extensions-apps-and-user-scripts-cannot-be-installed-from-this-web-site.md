---
title: "Chrome: “Extensions, apps, and user scripts cannot be installed from this web site”"
locations:
  - http://feedback.livereload.com/knowledgebase/articles/85889
---

Google Chrome 21 no longer installs off-store extensions by default (see [issue 128748 in Chromium](http://code.google.com/p/chromium/issues/detail?id=128748)). To install an extension outside of Chrome Web Store, you now need to:

*   manually download the file (right click → Save As…)
*   open the Extensions page in Chrome (Window → Extensions)
*   drag the downloaded .crx file into the Extensions page

A user reports that launching Chrome with&nbsp;`--enable-easy-off-store-extension-install` option will restore the old functionality so that no drag and drop is needed.

We are considering whether LiveReload extension should return to the Chrome Web Store. Let us know what you think.
