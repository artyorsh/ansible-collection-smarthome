#!/bin/bash
set -euxo pipefail

# Start dbus and avahi-daemon
mkdir -p /var/run/dbus/
rm -f /run/dbus/dbus.pid
dbus-uuidgen > /var/lib/dbus/machine-id
dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
avahi-daemon --daemonize

# Run anything else you want to run before HA starts...

# Run original entrypoint
exec /init