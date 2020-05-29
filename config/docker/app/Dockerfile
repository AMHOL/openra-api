FROM ruby:2.7.0

RUN apt-get update -qq \
    && mkdir -p /usr/share/man/man1 \
    && mkdir -p /usr/share/man/man7 \
    && apt-get install \
    -y --no-install-recommends git build-essential libpq-dev postgresql-client \
    && rm -rf /var/lib/apt/lists/*

ENV APP /usr/src/app
ENV PATH $APP/bin:$PATH

ENV BUNDLE_JOBS 4
ENV BUNDLE_PATH /usr/local/bundle

WORKDIR $APP

ENTRYPOINT ["config/docker/app/entrypoint.sh"]

CMD ["start_server"]
