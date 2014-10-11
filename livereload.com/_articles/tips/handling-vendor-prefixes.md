---
title: Handling vendor prefixes
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86176
---

## Recommended: use CSS compilers

We recommend using a CSS preprocessor like LESS, SASS or Stylus to take care of CSS3 vendor prefixes. Besides making your code easier to write, a properly executed solution will help you maintain vendor prefixes over time, as CSS3 standard goes mainstream.

Take a look at our [choosing a CSS preprocessor article](http://go.livereload.com/csspreproc).

If you want CSS3 prefixing to be absolutely transparent, Stylus + [Nib](http://visionmedia.github.com/nib/) do that out of the box. Stylus might not be for everyone, though; we recommend Compass as your default choice, please read that article mentioned above.

If you want to go with LESS, you may find [this Nettuts suggestion](http://net.tutsplus.com/tutorials/html-css-techniques/quick-tip-never-type-a-vendor-prefix-again/) or a [seemingly more complete solution by Derek Allard](http://www.derekallard.com/blog/post/less-css3-mixins-and-vendor-prefixes) useful for dealing with vendor prefixes.

## Alternative: prefix-free

[Prefix-free](http://leaverou.github.com/prefixfree/) is a lightweight browser-side solution to this problem. LiveReload 2.3.9+ supports it — [grab the latest beta here](http://go.livereload.com/beta) if v2.3.9 hasn't yet hit the Mac App Store.

On v2.3.8 or earlier, prefix-free breaks the live CSS preview function.