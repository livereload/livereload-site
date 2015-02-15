---
title: Choosing a CSS preprocessor
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86227
---

## Default choice: SASS / Compass

If you are not using any preprocessors at the moment, we recommend you take a look at [Compass](http://compass-style.org/), which is a framework on top of [SASS](http://sass-lang.com/).

Pros:

*   SASS aims to be a reasonably conservative, designer-friendly language
*   Compass is a higher-level library of mixins, with some common CSS helpers like [reset](http://compass-style.org/reference/compass/reset/), [layout elements](http://compass-style.org/reference/compass/layout/), [typography](http://compass-style.org/reference/compass/typography/), [dealing with CSS3](http://compass-style.org/reference/compass/css3/), [image sprites etc](http://compass-style.org/reference/compass/utilities/) built-in, and a choice of third-party plugins for:

    *   grid systems
    *   CSS frameworks like Twitter Bootstrap or ZURB foundation
    *   all kinds of utility stuff
    *   …check out the [huge list of Compass plugin gems](https://rubygems.org/search?utf8=%E2%9C%93&amp;query=compass)

Not a good choice when:

*   you're looking for (even more) advanced metaprogramming in your stylesheets
*   you're a syntax junkie like me

Getting started:

*   still looking for a great tutorial to mention here

{% ref languages/sass: More info on using SASS or Compass with LiveReload %}

## Want something simple? Take LESS

[LESS](http://lesscss.org/) helps to simplify your stylesheets, but intentionally does not try to be a programming language. As a result, it is very simple, but it wouldn't be easy to build something like Compass around it — which is why there isn't any.

Pros:

*   another popular choice; LESS is what most people have originally started with
*   there isn't much to learn; read the home page and you're now a certified less expert
*   stylish top to bottom — a signature creation of @cloudhead
*   there is an option of in-browser compilation —&nbsp;not like you'd need it with LiveReload, though, but worth mentioning

Not a good choice when:

*   you're looking for more high-level things than merely making your stylesheet easier to write — if you want someone else to handle browser incompatibilities for you then, again, Compass should be your default choice
*   you're looking for some more advanced automation of your repetitive CSS work

{% ref languages/less: More info on using LESS with LiveReload %}

## Hacker at heart? Consider Stylus

[Stylus](http://learnboost.github.com/stylus/) is made by TJ Holowaychuk, also known as github.com/visionmedia. If you recognize him by the name, or simply love to be meta, try Stylus. It allows infinite possibilities of metaprogramming and has a very lean syntax.

Your only choice if:

*   you routinely kill for a better-looking syntax
*   the idea of prefixing variable names with funny characters gives you shrinks
*   you want to redefine standard CSS properties like font-size to transparently do something else
*   you'd like to invent your own CSS selectors and make them look just like any other CSS selector, and then provide a hideous implementation
*   you want to transparently recompute all your px-based sizes into %-based sizes in your CSS, without making it look any different (you'd have to code this yourself, though — took me several hours)

Not a good choice if:

*   you take practical and clear over smart any time
*   you want a choice of community-provided plugins — so far, Stylus community does not seem to be booming despite the huge flexibility of this language

Stylus has [Nib](http://visionmedia.github.com/nib/), which aims to be a rough equivalent of Compass — minus those hundreds of plugins, plus a super-clean unobtrusive syntax. It _could_ evolve to be the recommended choice for everyone, but so far, the community support is not there.
