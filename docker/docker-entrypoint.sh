#!/bin/sh
set -e

if [ -n "$AUTHORIZED_KEYS" ]; then
  echo putting authorized_keys into /etc/ssh/authorized_keys
  echo "$AUTHORIZED_KEYS" >/etc/ssh/authorized_keys
  chmod 644 /etc/ssh/authorized_keys
fi

exec supervisord