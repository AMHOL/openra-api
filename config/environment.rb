# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra'
require 'openra-commands'
require_relative '../openra/api/endpoints'

post '/replays/metadata' do
  Openra::API::Endpoints::Replays::Metadata.new.(self, params)
end


post '/replays/data' do
  Openra::API::Endpoints::Replays::Data.new.(self, params)
end
