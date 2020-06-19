#!/bin/bash
set -e

if [ "$RACK_ENV" = 'development' ]; then
  cp "config/docker/nginx/nginx.dev.conf" '/tmp/docker.nginx'
else
  cp "config/docker/nginx/nginx.conf" '/tmp/docker.nginx'
fi

envsubst '$APP,$SERVER_NAME' < '/tmp/docker.nginx' > '/etc/nginx/conf.d/default.conf'

if [ "$1" = 'start_server' ] && [ $# = 1 ]; then
  exec nginx -g "daemon off;"
fi

exec "$@"
