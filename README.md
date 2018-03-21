Qt build environment for various target platforms
=================================================

This repository contains docker files for a Qt build environment with Qbs. It is
based upon Ubuntu 16.04. The following target platforms are supported:

- x86_64-linux (gcc 5.4.0)
- x86_64-mingw32-w64 (mingw32 5.3.1)

Containing Qt packages:

- qtcore
- qtdeclarative
- qtnetwork
- qtxml

Releases are built using travis-ci and pushed to dockerhub.


How to use
----------

Pull the latest version from docker hub:

```sh
docker pull rweickelt/qbs:latest
```

Execute qbs on a file in the current directory:

```sh
docker run -v ${PWD}:/myproject rweickelt/qbs \
    install -f /myproject.qbs --install-root /myproject/results \
    profile:qt5
```

This mounts the current directory as ``/myproject`` inside the docker
container and executes qbs on it. The build result is written to
``/myproject/results`` and hence, into a subfolder ``results`` in the current directory.


Changelog
---------
