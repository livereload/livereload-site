---
title: SASS / Compass
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86203
---

(Also see our [article on choosing a CSS preprocessor language](http://go.livereload.com/csspreproc) if you're not sure which one is for you.)

Both SASS and Compass are fully supported.

## Partials

The underscore naming convention for partials is supported too. The only issue is that files that start with an underscore but aren't included anywhere will still be compiled (i.e. you have to actually include a partial somewhere for it to be considered a partial).

If you have multiple partials with the same file name (e.g. foo/_all.scss and bar/_all.scss), LiveReload might be confusing them when calculating import graphs. If LiveReload mistakenly tried to compile your partials and you have multiple partials with equal file names, please consider renaming them.

## Using Compass

IMPORTANT: Be sure that the folder added to LiveReload is Compass's root folder.

If you are running a version of LiveReload earlier than 2.0 β2, please upgrade, since Compass support has been greatly improved since then.

If you use Compass plugins, make sure the version of Ruby selected in compilation options is the one that you have installed the plugins into. (If your version of Ruby is not listed there, please pick the system Ruby and install the required plugins there.)

If you get the following error:

    Nothing to compile. If you're trying to start a new project, you have
    left off the directory argument. Run "compass -h" to get help

it means that you've added a wrong folder. You need to add the root compass folder, not a subfolder or a parent folder.

## Compass vs. SASS project detection

LiveReload detects a project as a Compass one if one of the following conditions hold true:

*   there is a file `config/compass.rb`, `.compass/config.rb`, `config/compass.config`, `src/config.rb` or `config.rb` somewhere in your project which contains a literal string `compass plugins` or `preferred_syntax = :` inside
*   there is an SCSS/SASS file that imports `compass*` or `*ZURB-foundation*`

If that does not work for your project, please contact us and we'll fix it.