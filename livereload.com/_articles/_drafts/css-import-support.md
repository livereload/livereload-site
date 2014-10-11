---
title: CSS @import support
draft: true
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86173
---

Starting with 2.0α8 and browser extensions 2.0, LiveReload supports reloading of @import'ed stylesheets.

Because of browser bugs, reloading of imported stylesheets has a 200ms lag (which we use to run some caching trickery).

If this does not work for you, please contact support so that we can fix it.

## The bad browser bug

Modifying a CSS @import rule to reference a not-yet-cached file causes WebKit to lose all document styles, so we have to apply a workaround that causes a lag.

Our workaround is to add a temporary LINK element for the imported stylesheet we're trying to reload, wait 200ms to make sure WebKit loads the new file, then remove the LINK tag and recreate the @import rule. This prevents a flash of unstyled content. (We also wait 200 more milliseconds and recreate the @import rule again, in case those initial 200ms were not enough.)