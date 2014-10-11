---
title: Using with a version control system (Git, SVN, Hg, etc)
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86185
---

If:

*   you are not using LiveReload compilers,
*   you use the compilers, but don't commit their output into your version control system

then there is nothing to consider for you. LiveReload should work fine no matter what you do, and won't cause additional problems.

If:

*   you use the compilers AND commit their output into your version control system

then you need to be careful when doing large-scale Git operations such as rebase, bisect or filter-branch. LiveReload may recompile source files on each step of those operations, which may cause Git to choke. Until we have a better solution, we recommend to quit LiveReload before doing operations that rewrite or alter your commit history (of course, you can always try with LiveReload running, and only quit it if Git decides to choke).