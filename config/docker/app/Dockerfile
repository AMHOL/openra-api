FROM ruby:2.7.0

ENV APP /usr/src/app
ENV PATH $APP/bin:$PATH

ENV BUNDLE_JOBS 4
ENV BUNDLE_PATH /usr/local/bundle

WORKDIR $APP

ENTRYPOINT ["config/docker/app/entrypoint.sh"]

CMD ["start_server"]
