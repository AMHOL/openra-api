FROM nginx:alpine

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

COPY config/docker/nginx/nginx.conf /tmp/docker.nginx

# put the final config in its place

RUN envsubst '$APP_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf
EXPOSE 80

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM
# (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]
