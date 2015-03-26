---
title: “Trial version has expired”, but I've purchased from the Mac App Store
locations:
  - http://feedback.livereload.com/knowledgebase/articles/91690
---

Thanks for purchasing the app.

Looks like you are still running the beta version, though, which has now expired. The Mac App Store version can never display that error. What probably happened is that Mac App Store has installed LiveReload to a different path than the one you have expected.

Please try the following:

1. Delete all copies of LiveReload.app you can find. That includes copies in the Downloads folder and, if you ever tried to build LiveReload from source, the build products.

2. Optionally, check that no more copies remain by running the following command in the Terminal:

        open -b com.livereload.LiveReload

    If LiveReload.app is not found, you'll get an error message on your Terminal.

    If LiveReload.app is found, it will be launched, and you can determine its path by running:

        ps x | grep LiveReload

3. Reinstall it from the Purchases app on the Mac App Store.

Alternatively, if you're short on time, you can simply [install the latest beta](/beta/).
