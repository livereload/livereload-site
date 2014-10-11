---
title: LiveReload Protocol
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86174
---

This protocol describes the communication between a LiveReload server (LiveReload 2, rack-livereload, guard-livereload etc) and the client ([livereload.js](https://github.com/livereload/livereload-js) script, livereload browser extensions or whoever else may choose to connect).

## Status

This protocol is in use by production versions of LiveReload 2, [LiveReload browser extensions 2.x](http://go.livereload.com/extensions)&nbsp;and rack-livereload.

The older protocol v6 is deprecated, and its support will be removed as soon as critical players (guard-livereload) upgrade to v7.

## Basics

*   LiveReload server MUST speak web sockets and HTTP on the same port. The port number SHOULD be 35729\. Web socket connections MUST use `/livereload` as the path to connect to (e.g. `ws://localhost:35729/livereload`).

## HTTP protocol

*   LiveReload server MUST serve livereload.js (or another similar script implementing the client side of this protocol and compatible with URI options that livereload.js accepts) on HTTP path /livereload.js of the web sockets port.

## Web Socket Protocol

*   Every web socket message MUST be a JSON object with a `command` key (a string).

*   Upon connection, a handshake takes place:

    *   Each party MUST send a 'hello' message immediately upon connection, and MUST NOT send any other messages before receiving a 'hello' message from the other party.
    *   The 'hello' message MUST specify a list of protocol URLs that the party wants to speak.
    *   Each protocol URL MUST be globally unique, and MUST point to an HTML or text document either describing the protocol itself or referencing the related product.
    *   After sending and receiving a 'hello' message, the parties implicitly agree to speak the intersection of the protocols they mentioned, picking the latest versions supported by both parties.
    *   If the intersection of the protocols is unsuitable to a party, it MUST close the web socket connection.

*   Each command MUST be defined by one of the negotiated protocols. Each JSON object MUST conform to all negotiated protocols; in particular, this means it MUST only contain keys defined by some of the negotiated protocols, and MUST NOT use any other keys. (A particular vendor can always define its own freeform protocol if it wants to use random unspecified keys. Point is that unless such a protocol is negotiated, no additional keys are permitted.)

*   Handshake, client-to-server.

      {
          command: 'hello',
          protocols: [
              'http://livereload.com/protocols/official-7',
              'http://livereload.com/protocols/official-8',
              'http://livereload.com/protocols/2.x-origin-version-negotiation'],
      }
    `</pre>
*   Handshake, server-to-client:
    <pre>`  {
          command: 'hello',
          protocols: [
              'http://livereload.com/protocols/official-7',
              'http://livereload.com/protocols/official-8',
              'http://livereload.com/protocols/official-9',
              'http://livereload.com/protocols/2.x-origin-version-negotiation',
              'http://livereload.com/protocols/2.x-remote-control'],
          serverName: 'LiveReload 2',  // or e.g. "guard-livereload"; string suitable for "Connected to %s" message
      }
    `</pre>
*   HELLO message may contain additional fields according to one of the protocols described in it. Thus any unknown fields MUST be ignored. This is an exception to the general rule, and should be used sparingly.

    ## Official Protocol Version 7

    Here's a proposal of a protocol called `http://livereload.com/protocols/official-7` (previous protocols were called `1.1`–`1.6` after LR versions, so we're starting with 7 to avoid confusion).

*   URL update, client-to-server:
    <pre>`  {
          command: 'url',
          url: 'http://example.com/some/page'
      }
    `</pre>
*   Reload request, server-to-client:
    <pre>`  {
          command: 'reload',
          path: 'path/to/file.ext',   // as full as possible/known, absolute path preferred, file name only is OK
          liveCSS: true               // false to disable live CSS refresh
      }
    `</pre>
*   Alert request, server-to-client, can be used by console servers to announce important things (like 'Upgrade your browser extension!') to the user.
    <pre>`  {
          command: 'alert',
          message: 'HEY!'
      }