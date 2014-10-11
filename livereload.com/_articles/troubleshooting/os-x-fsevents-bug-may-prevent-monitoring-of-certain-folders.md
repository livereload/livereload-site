---
title: OS X FSEvents bug may prevent monitoring of certain folders
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86239
---

OS X has a rarely-occuring bug that causes some folder to get 'broken' with regards to file system change monitoring via FSEvents.

LiveReload detects this case and warns the user:

![error_folder_cannot_be_monitored.png](http://assets.livereload.com/error_folder_cannot_be_monitored.png)

In case you wonder, the bug is related to case (in)sensitivity of the file system. For certain folders, either realpath or FSCopyAliasInfo APIs report their names in incorrect case. This somehow causes the FSEvents system (used by LiveReload to monitor file system changes) to never report any changes for those folders and their subfolders.

(If you are _really_ curious, more details can be found in [Radar #10207999](http://openradar.appspot.com/10207999), in [rb-fsevents issue #10](https://github.com/thibaudgg/rb-fsevent/issues/10) and in [find-fsevents-bug repository](https://github.com/andreyvit/find-fsevents-bugs).)

## Fixing it

Because we don't know the real cause of the bug, there is no surefire way to resolve it. However, one of the following actions has always helped so far:

*   rebooting the computer
*   checking the disk and repairing permissions via Disk Utility
*   adding the folder to Spotlight privacy list (the list of folders to not index), and then removing from it, effectively forcing a reindexing
*   renaming the folder, and then possibly renaming it back
*   re-creating the folder and moving the old contents back into it

If these steps do not work, please let us know! In fact, if they worked, please give us a note too, indicating which of them has worked for you.