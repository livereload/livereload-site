---
title: I don't like LiveReload, can you recommend something else?
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86189
---

Sure! Depends on why LiveReload isn't suitable for you, though.

## LiveReload is too expensive for me

This one is easy. Just use the unlimited trial version, and optionally open a support request to ask for a free license. I always give free licenses to everyone who asks.

## I don't like LiveReload, but I still want some native app

Fair enough. If you're on a Mac, try [Brian Jones' CodeKit app](http://incident57.com/codekit/) — it is generally regarded as awesome, and people who don't like the UI of LiveReload are probably looking for something like that.

Also try these ones:

*   [Fire.app](http://fireapp.handlino.com) has a similar functionality and has pretty much no UI except for the menu bar icon. The authors are very nice, and they actually use LiveReload's browser extensions (which are open-source and thus free to reuse).

*   [SimpLESS](http://wearekiss.com/simpless) will get your LESS compiled on any platform

## <span style="line-height: 19px;">I'd rather use a command-line tool</span>

<span style="line-height: 19px;">I'm considering a command-line mode for LiveReload 3.x, btw.</span>

*   [guard-livereload](https://github.com/guard/guard-livereload) — awesome open-source command-line tool
*   [Python LiveReload server](http://lepture.com/project/livereload/) — also has guard-like features
*   [livereload 1.x](https://github.com/mockko/livereload) — the original command-line tool that started it all, now deprecated (because guard-livereload is more popular, and it made zero sense for two open-source command-line tools to compete)

## I'd rather use a JavaScript-only solution that's based on polling

Beware: These ones might be easier to get running, but will eat up your CPU and battery:

*   [live.js](http://livejs.com/) is a browser script that continuously updates the page in the browser
*   [CSSrefresh](http://cssrefresh.frebsite.nl/) seems to be similar to live.js
*   [Reloadr](https://github.com/dbergey/Reloadr) is a tool for PHP that does continuous polling like live.js

## Other options

*   [nodeJuice](http://nodejuice.com/)&nbsp;is a command-line tool, seems similar to LiveReload, but I haven't heard of it much