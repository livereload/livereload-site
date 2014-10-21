---
title: How do I install and use the browser extensions?
order: 10
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86242
---

## Installing extensions

Download and open to install:

* [Safari extension 2.0.9](http://download.livereload.com/2.0.9/LiveReload-2.0.9.safariextz) — note: due to Safari API limitations, browser extension **does not work with file: URLs**; if you're working with local files via file: URL, please use Chrome or insert the snippet

* [Chrome extension on the Chrome Web Store](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei) — **if you want to use it with local files,** be sure to enable “Allow access to file URLs” checkbox in Tools &gt; Extensions &gt; LiveReload after installation.

* [Firefox extension 2.0.8](http://download.livereload.com/2.0.8/LiveReload-2.0.8.xpi)

Extensions 2.x will be updated automatically.

## Using extensions

1.  Make sure LiveReload 2 is running
2.  Click the LiveReload toolbar button to enable or disable LiveReload.

LiveReload toolbar button is located in the main toolbar in Chrome and Safari, and in the Add-on Toolbar in Firefox (at the bottom).

The icon indicates LiveReload status of the current tab (unavailable / disabled / enabled, connecting / enabled, connected).

If your page already includes LiveReload via a SCRIPT tag, it is considered to be in 'enabled' state initially. You can still disable or reenable it using the toolbar button.

## What's new

2.0.9: Updated toolbar icons to the ones contributed by Vadim Makeev (pepelsbey). Thanks! Chrome extension published on the Chrome Web Store.

2.0.5: Enabled autoupdating. Updated bundled livereload.js (for use with old-style clients like guard-livereload and livereload 1.x).

2.0.3: Firefox-only update that fixes handling of frames

2.0.2:

* fixed disconnection on each full page reload (yep very lame);
* update livereload.js so that extension, snippet and livereload.js version numbers are now reported to the LR server

2.0.1: fixed support of protocol v6 (i.e. older LR-compatible Ruby gems and older builds of LR2)

2.0.0 (alpha quality!):

*   all extensions have been rewritten from scratch
*   extensions no longer handle web socket communication —&nbsp;they simply insert a SCRIPT tag into the page, which loads livereload.js, the same one you'd include if you [weren't using extensions at all](http://help.livereload.com/kb/general-use/using-livereload-without-browser-extensions)
*   all extensions have a toolbar button now (previously Safari was using a context menu item) and use the same icons
*   the [new live reload protocol](http://help.livereload.com/kb/ecosystem/livereload-protocol) is now supported
*   the old protocol is supported too, for compatibility with livereload and guard-livereload gems
*   servers that implement the new protocol can provide their own livereload.js, thus eliminating the need to update extensions often (and avoiding client/server version mismatches); older servers are served with a bundled version of livereload.js

## Open-source

{% ref about/open-source: LiveReload browser extensions are open-sourced %}
