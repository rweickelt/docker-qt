#!/usr/bin/env bash

#
# Try to determine the uid of the working directory and adjust the current
# user's uid/gid accordingly.
#
WORKDIR_GID=$(stat -c "%g" .)
WORKDIR_UID=$(stat -c "%u" .)
USER_NAME=${USER_NAME:-devel}
EXEC=""

if [ "$(id -u ${USER_NAME})" != "0" ] && [ "${WORKDIR_UID}" != "0" ] ; then

    export HOME=/home/${USER_NAME}

    if [ "$(id -u ${USER_NAME})" != "${WORKDIR_UID}"  ]; then
        usermod  -u ${WORKDIR_UID} ${USER_NAME}
        groupmod -g ${WORKDIR_GID} ${USER_NAME}
        chown -R -h ${WORKDIR_UID} /home;
        chgrp -R -h ${WORKDIR_GID} /home;
    fi
    EXEC="exec gosu ${USER_NAME}:${USER_NAME}"
fi

if [ -z "$1" ]; then
    ${EXEC} bash --login
else
    ${EXEC} bash --login -c "$*"
fi
