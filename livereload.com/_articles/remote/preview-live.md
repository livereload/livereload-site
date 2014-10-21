---
title: Preview CSS changes against a live site, then upload when done
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86220
---

If most of the work you do is tweaking styles, you can preview your changes against a live site and only upload them when done:

1.  Make sure you have an up-to-date local copy of the CSS (SASS, LESS, etc) files you want to edit.
2.  Add the local folder to LiveReload and enable URL overriding (“Override URLs to serve modified CSS from localhost”) in Monitoring Options.
3.  Install the LiveReload browser extension if not already installed.
4.  Go to the live site and turn LiveReload on by clicking the toolbar button.
5.  Change a CSS file locally and watch it being applied to your site.
6.  When satisfied, actually upload the new CSS.

Limitations:

*   unlike in CSSEdit, you have to save the file to apply the new styles to the browser; in the future we are going to provide some editor plugins to handle this without saving, at least in Sublime Text 2
*   each time you reload the browser page, you need to save the modified CSS files again to trigger override
*   identically-named files in different folders will probably confuse LiveReload

The last two limitations will be fixed in one of the upcoming updates.

See [an overview of other remote workflows](http://go.livereload.com/remote).