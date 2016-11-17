#! /bin/sh
RUNUSER_UID="${RUNUSER_UID:-1000}"
export PYTHONPATH="$PYTHONPATH:/usr/lib/python3/dist-packages"
set -ux
if [ -x /usr/sbin/useradd ] ; then
    useradd -s /bin/false --no-create-home --home-dir /home/runuser --uid $RUNUSER_UID runuser
else
    adduser -s /bin/false -D -h /home/runuser -H -u $RUNUSER_UID runuser
fi
exec gosu runuser "$@"
