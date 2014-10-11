---
title: If you edit files directly on your server
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86280
---

Unless you use [one of the supported remote workflows](http://go.livereload.com/remote), LiveReload 2 won't work when your changes never reach the local disk. Examples of unsupported workflows are:

*   editing with Vim or similar directly on the remote server
*   using Coda without a local copy of the sources

However, if you have ssh access to your server and you can install Ruby gems on it, you still can get live reloading to work using our browser extensions and a command-line tool called guard-livereload.

Quick instructions:

1.  Make sure Ruby 1.8.7+ and a recent version of RubyGems (perhaps 1.8+) is installed on the server.

2.  Install guard and guard-livereload: `sudo gem install guard guard-livereload` (whether you need sudo or not depends on your system configuration)

3.  SSH into your server, cd into your project folder and run:

    guard init
    ``guard init livereload`</pre>
     This will create a file named “Guardfile” which tells Guard what to do when files are modified. Guard has multiple plugins to handle all kinds of actions; guard-livereload is one of them.
4.  Run `guard` command on the server (remember to do this from your project folder). You should get a line saying that LiveReload is now listening.
5.  Make sure LiveReload 2 is _not_ running. You need the corresponding TCP port to be free on the next step.
6.  Forward LiveReload's port to your server, so that local browser extensions can connect to guard-livereload running remotely. You need to run ssh with the following arguments:
    <pre>` ssh -L 35729:127.0.0.1:35729 …

 where … is the usual stuff you type after `ssh`. You need to keep this command running to be able to use LiveReload.

 If things don't work, and/or on the next step ssh says something about not being able to open a channel, please check that your server has SSH port forwarding enabled. Most shared hosts don't, and even if you have your own server it may be disabled by default.

7.  Now you can open the remote site in your browser and turn LiveReload on.

That should work. Please let us know if it does not.

See [an overview of other remote workflows](http://go.livereload.com/remote).