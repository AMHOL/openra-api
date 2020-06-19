FROM nginx

ENV APP /usr/src/app

WORKDIR $APP

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["config/docker/nginx/entrypoint.sh"]

CMD ["start_server"]
