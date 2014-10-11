---
title: LiveReload URL API
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86230
---

LiveReload can be controlled using `livereload:command?params` URLs. This can be used by scripts to programmatically change LiveReload folder settings.

## Adding or updating projects

Syntax: `livereload:add?path=/some/folder&amp;compiler-sass-mode=compile`

Path is a URL-encoded path to the folder in question. (You can skip URL encoding as long as the path does not contain ampersands, percent signs or plus characters.)

For example, to add `~/Desktop/Foo`, run:

    open "livereload:add?path=~/Desktop/Foo"
    `</pre>

    <span class="Apple-style-span" style="color: rgb(46, 47, 51); font-size: 22px; font-weight: bold; line-height: 22px; ">Removing projects</span>

    Syntax: `livereload:remove?path=/some/folder`

    For example:

    <pre>`open "livereload:remove?path=~/Desktop/Foo"
    