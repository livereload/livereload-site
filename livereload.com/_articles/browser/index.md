---
title: How do I choose the best integration method?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/87979
---

**Background:** To communicate with your browsers, LiveReloads needs its JavaScript code to be injected into your web pages. (If you're curious, see more details in {% ref internals/browsers: How does LiveReload talk to my browsers? %})

There are 3 ways to arrange that:

1. Either add a script tag into your HTML code manually,
2. or install a browser extension (that, when activated, adds the script tag to the visited pages on the fly),
3. or use a plugin for your web framework (that adds the script tag on the fly when serving requests), currently only available for Rails/Rack.

So **how do you choose?**

Use method 1 (insert a tag) or method 3 (framework plugin) if:

* you want live reloading for sites open on **iPhone, iPod, iPad** devices or iOS simulator (and, soon, Android devices/emulators)

* you want live reloading for sites open on other computers on your network without browser extensions installed

* you want to work with file: URLs in Safari (because Safari prohibits extensions from accessing file: URLs under any circumstances)

Use method 2 (browser extension) if:

* you want to preview CSS changes against a live site

* you want to use the upcoming "saving CSS changes from web inspector" feature

* **most people prefer this method** because it requires no changes to your projects

You can use both if you need to; the script tag you add manually will happily cooperate with the browser extension.

**Ready to act?** See one of these articles for detailed instructions:

1. {% ref browser/script-tag %}
2. {% ref browser/extensions %}
3. {% ref frameworks/plugins %}
