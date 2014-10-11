---
title: Usage Statistics & Privacy Policy
locations:
  - http://feedback.livereload.com/knowledgebase/articles/86197
---

## Usage Statistics

LiveReload “pings” our servers once a day. Why? Because it's very motivating for us to watch the number of users grow over time.

When pinging, LiveReload sends the following information. We don't currently use most of these numbers, but we plan to aggregate them in the future.

*   version number (because we want to make our compatibility decisions based on which versions are active in the wild and how quickly users upgrade)
*   number of changes to compilable files per each compiler type (because we want to spend extra time polishing the most popular compilers)
*   number of 'reload' commands send to your browsers (because we may want to group the above numbers by “seniority level” to find patterns like: many active LiveReload users prefer SASS, while novice users often stick to LESS — that's useful to guide our UI and documentation decisions)

There is additional info implicitly shared by the act of sending the “ping” to our servers via HTTP:

*   your IP address (used to group pings by IPs, so that a single person cannot screw the statistics by sending many repeated pings)
*   your CFNetwork user agent, which can be used to determine your Mac model and OS version (we don't currently use it for anything; if we ever need to make a hardware support decision, however, we'll have the info to base it on)

Currently there is no way to disable the pings, although we will add a hidden preference to do it soon.

## Privacy Policy

We won't ever share anything that can be traced back to you — right now that means your IP address. The aggregate info that we use is accessible publicly at the mentioned stats page, and you can check that there are no concerns for your privacy there. (The page also does not accept any input or cookies, so there is no way to hack it, and it is incapable of displaying something else anyway.)

For optional newsletter subscriptions, we collect your email addresses and some additional info of yours. That info will only ever be shared with a respectable email newsletter management service, which is currently http://www.campaignmonitor.com/.