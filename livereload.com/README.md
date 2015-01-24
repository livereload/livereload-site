LiveReload.com
==============

Prerequisites:

* Ruby
* Node.js
* Oracle JDK (for s3_website)
* Jekyll with Marked: `sudo gem install jekyll kramdown`
* marked npm module: `sudo npm install marked -g`
* [s3_website](https://github.com/laurilehmijoki/s3_website): `sudo gem install s3_website`

To preview the site:

    jekyll serve

To build and publish the site:

    jekyll build
    s3_website push
