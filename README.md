# Openra-api

Openra-api is a JSON API interface for the [openra](https://github.com/AMHOL/openra-ruby) gem, it offers the following endpoints:

* `POST /replays/data` Extract data from replay file
* `POST /replays/metadata` Extract metadata from replay file


### Setup

* `cp .env.example .env` (and modify appropriately)
* `docker-compose build`
* `docker-compose run --rm app bundle install -j4`
* `sudo ./bin/init-letsencrypt --email={{email}}`
* `docker-compose up -d`
