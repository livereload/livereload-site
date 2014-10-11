---
title: "How do I work with file: URLs?"
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86187
---

LiveReload is cool with file: URLs, unless you're using a Safari browser extension, which does not allow that. (See: [How do I choose the best integration method?](http://feedback.livereload.com/knowledgebase/articles/87979-how-do-i-choose-the-best-integration-method-))

We recommend Chrome over Safari for file: URLs. If, however, you prefer to develop in Safari with a browser extension, we recommend one of these approaches:

*   save your files as e.g. `~/Sites/something/foo.html`, and view it as `http://localhost/~username/something/foo.html`, where username is your short user name (don't forget to also enable Web Sharing in System Preferences)

*   put a symlink into Sites folder to your project directory (you need to [enable symlinks first as described here](http://stackoverflow.com/questions/3775102/creating-a-symbolic-link-in-sites-directory))

*   use [MAMP](http://www.mamp.info/en/index.html)

*   use [XAMP](http://www.apachefriends.org/en/xampp-macosx.html)
