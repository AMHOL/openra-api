# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra'
require 'openra-commands'
require_relative 'endpoints'

module Openra
  module API
    class Application < Sinatra::Base
      before do
        content_type 'application/json'
      end

      post '/replays/metadata' do
        Openra::API::Endpoints::Replays::Metadata.new.(self, params)
      end

      post '/replays/data' do
        Openra::API::Endpoints::Replays::Data.new.(self, params)
      end

      error Sinatra::NotFound do
        [404, '{}']
      end
    end
  end
end
