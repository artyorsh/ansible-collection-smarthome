#!/bin/bash
set -euxo pipefail

mkdir -p /var/run/dbus/
rm -f /run/dbus/dbus.pid
dbus-uuidgen > /var/lib/dbus/machine-id
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address

avahi-daemon --daemonize

exec /init