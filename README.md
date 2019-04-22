Qt build environment for various target platforms
=================================================

This repository contains docker files for a Qt build environment with Qbs. It is
based upon Ubuntu 16.04. The resulting docker image makes it very easy to build
Qt applications in any continuous delivery pipeline. Releases are built using
travis-ci and pushed to
[dockerhub](https://hub.docker.com/r/rweickelt/qt/tags/).

The following target platforms are supported:

- x86_64-linux (gcc 5.4.0)
- x86_64-mingw32-w64 (mingw32 5.3.1)

Containing Qt modules (Qt 5.9.8):

- qtcore
- qtdeclarative
- qtnetwork
- qtserialport
- qtxml

A lot of Qt modules are missing at the moment because otherwise the build
process would exceed Travis' 50 minutes time limit. They might be added at a
later point.


How to use
----------

Pull the latest version from docker hub:

```sh
docker pull rweickelt/qt:latest-mingw-w64
```

Execute qbs on a file in the current directory:

```sh
docker run -v ${PWD}:/myproject rweickelt/qt:mingw-w64-latest \
    install -f /myproject.qbs --install-root /myproject/results \
    profile:qt5
```

This mounts the current directory as ``/myproject`` inside the docker container
and runs qbs on it. The build result is written to ``/myproject/results`` and
hence, into a subfolder ``results`` in the current directory.

The default profile is qt5 and could be also ommitted.


Changelog
---------
