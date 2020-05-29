#!/bin/bash
set -e

if [ -f "/usr/src/app/tmp/pids/puma.pid" ]; then
  rm "/usr/src/app/tmp/pids/puma.pid"
fi

if [ "$1" = 'start_server' ] && [ $# = 1 ]; then
  exec bin/bundle exec puma -C "$APP/config/docker/app/puma.rb" -e development
fi

exec "$@"
