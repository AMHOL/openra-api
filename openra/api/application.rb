# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra'
require 'openra-commands'
require_relative 'utils'
require_relative 'endpoints'

module Openra
  module API
    class Application < Sinatra::Base
      before do
        content_type 'application/json'
      end

      post '/replays/metadata' do
        Openra::API::Endpoints::Replays::Metadata.new.(
          self,
          Openra::API::Utils::FileResolver.new.call(:upload, params)
        )
      end

      get '/replays/metadata/oraladder/:hash' do
        Openra::API::Endpoints::Replays::Metadata.new.(
          self,
          Openra::API::Utils::FileResolver.new.call(:oraladder, params)
        )
      end

      get '/replays/metadata/ragl/:hash' do
        Openra::API::Endpoints::Replays::Metadata.new.(
          self,
          Openra::API::Utils::FileResolver.new.call(:ragl, params)
        )
      end

      post '/replays/data' do
        Openra::API::Endpoints::Replays::Data.new.(
          self,
          Openra::API::Utils::FileResolver.new.call(:upload, params)
        )
      end

      get '/replays/data/oraladder/:hash' do
        Openra::API::Endpoints::Replays::Data.new.(
          self,
          Openra::API::Utils::FileResolver.new.call(:oraladder, params)
        )
      end


      get '/replays/data/ragl/:hash' do
        Openra::API::Endpoints::Replays::Data.new.(
          self,
          Openra::API::Utils::FileResolver.new.call(:ragl, params)
        )
      end

      error Sinatra::NotFound do
        [404, '{}']
      end
    end
  end
end
