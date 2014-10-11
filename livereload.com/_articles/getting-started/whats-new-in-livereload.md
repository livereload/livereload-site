---
title: What's new in LiveReload?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/85008
---

Changes in 2.3.27:

*   None, just a Mac App Store version number for v2.3.26\. Not at all sure that Apple will approve the update, but submitting anyway.

Changes in 2.3.26:

*   Added a [hidden setting](http://feedback.livereload.com/knowledgebase/articles/195869-how-to-change-the-port-number-livereload-listens-o) to change LiveReload port number.
*   Fixed a ‘port occupied’ error message to actually show up.

Changes in 2.3.24:

*   Updated CoffeeScript to v1.6 with source maps, enable them in compiler options.
*   Updated HAML to v4, which is mostly backwards-compatible, but do check [the official blog post about HAML 4](http://blog.haml.info/post/42998475354/haml-4-0-has-been-released).
*   Updated ZURB foundation to v4\. Please open a support request if this change is unwelcome. See the [migration guide](http://foundation.zurb.com/migration.php).
*   Other compilers and libraries updated to the latest versions.

Changes in 2.3.22:

*   Fixed a bug with LiveReload hanging on the first compilation error.

Changes in 2.3.21:

*   Bundled compilers updated: SASS 3.2.5, Compass 0.12.2, LESS 1.3.3, CoffeeScript 1.4.0, IcedCoffeeScript 1.4.0a, Jade 0.28.0, HAML 3.1.7, SLIM 1.3.6.
*   Added MaxMonitoredFilesPerProject option to change the default limit of 100,000 files per project for those of you with really huge projects. Documented in “[Monitoring more than 100,000 files](http://feedback.livereload.com/knowledgebase/articles/154257-monitoring-more-than-100-000-files)” help article.

Changes in 2.3.20:

*   fixed handling of custom CoffeeScript output file names
*   signed with Developer ID

Changes in 2.3.18:

*   fixed a crash due to a buffer overflow bug in RPC code

Changes in 2.3.16:

*   fixed Susy
*   kill dates are gone, all builds will now work forever
*   off-Mac App Store licensing support
*   added unlimited trial mode
*   added Sparkle autoupdater
*   adjusted grace period on web socket disconnection — LiveReload now waits longer before stopping FS monitoring

Changes in 2.3.15:

*   added ZURB Foundation 3
*   all compilers updated to the latest versions

Changes in 2.3.14:

*   fix a URL overriding bug that caused stylesheets to disappear (because of&nbsp;spurious 403 errors)

Changes in 2.3.12:

*   fix a bug in `url(…)` CSS rewriting logic done when URL overriding is active
*   fix a crash when Internet connection is not available

Changes in 2.3.10/2.3.11:

*   support for ‘chained’ imports in Sass: `@import "foo", "bar", "boz"`
*   all compilers updated to the latest stable versions (to the latest prerelease versions for 2.3.11)
*   fixed a crash the occurred if the system-installed Ruby did not work

Changes in 2.3.9:

*   support for prefixfree _actually_ works

Changes in 2.3.8:

*   CoffeeScript, IcedCoffeeScript, Stylus and HAML updated to the latest versions

Changes in 2.3.7:

*   better handling of FS changes that occur during post-processing
*   stops output path autodetection madness (the rules are now much stricter)
*   correct handling of imported files with identical names located in different folders
*   some other bug fixes

Changes in 2.3.5/2.3.6:

*   updated all bundled compiles to the latest versions
*   fix a crash when modifying a compilable file with compilation mode off

Changes in 2.3.4:

*   ability to customize project name in the project list (try right-clicking and double-clicking)
*   ability to customize output file names (your feedback is required on the UI — I'm not 100% happy with it)
*   fixed output path autodetection heuristics when imported files are present (LiveReload was always meant to read your mind when setting up output paths)
*   fixed a bug which caused SASS imported files to sometimes not getting recognized as such

Changes in 2.3.0–2.3.3:

*   Stylus compiler now supports Nib
*   works with Chrome 19 and the latest beta of Safari, should resolve other intermittent connection problems
*   web socket communication is now done via Node.js and websocket.io