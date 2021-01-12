# Openra-api

Openra-api is a JSON API interface for the [openra](https://github.com/AMHOL/openra-ruby) gem, it offers the following endpoints:

* `POST /replays/data` Extract data from replay file
* `POST /replays/metadata` Extract metadata from replay file
* `GET /replays/data/oraladder/:hash` Extract data from oraladder.net file using hash
* `GET /replays/metadata/oraladder/:hash` Extract metadata from oraladder.net file using hash
* `GET /replays/data/ragl/:hash` Extract data from ragl.org file using hash
* `GET /replays/metadata/ragl/:hash` Extract metadata from ragl.org file using hash


### Setup

* `cp .env.example .env` (and modify appropriately)
* `docker-compose build`
* `docker-compose run --rm app bundle install -j4`
* `docker-compose up -d`
