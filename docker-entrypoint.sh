#! /bin/sh
RUNUSER_UID="${RUNUSER_UID:-1000}"

#export PYTHONPATH="$PYTHONPATH:/usr/lib/python3/dist-packages"
# Don't do this because it causes raven import to fail with
# File "/usr/lib/python3/dist-packages/pkg_resources.py", line 1520, in <module> register_loader_type(importlib_bootstrap.SourceFileLoader, DefaultProvider) AttributeError: module 'importlib._bootstrap' has no attribute 'SourceFileLoader'
# 
# Instead, sys.path.append('/usr/lib/python3/dist-packages')

set -ux
if [ -x /usr/sbin/useradd ] ; then
    useradd -s /bin/false --no-create-home --home-dir /home/runuser --uid $RUNUSER_UID runuser
else
    adduser -s /bin/false -D -h /home/runuser -H -u $RUNUSER_UID runuser
fi
exec gosu runuser "$@"
