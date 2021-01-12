# frozen_string_literal: true

require 'bundler/setup'
require 'sinatra'
require 'openra-commands'
require_relative 'errors'
require_relative 'utils'
require_relative 'endpoints'

module Openra
  module API
    class Application < Sinatra::Base
      CACHE = Openra::API::Utils::Cache.new(File.expand_path(File.join(root, '../../tmp/cache/openra-api')))
      ENDPOINTS = {
        metadata: Openra::API::Endpoints::Replays::Metadata.new(CACHE),
        data: Openra::API::Endpoints::Replays::Data.new(CACHE)
      }.freeze

      before do
        content_type :json
      end

      def development?
        self.class.environment == :development
      end

      post '/replays/metadata' do
        ENDPOINTS.fetch(:metadata).(self, params, source: :upload)
      end

      post '/replays/data' do
        ENDPOINTS.fetch(:data).(self, params, source: :upload)
      end

      get '/replays/metadata/oraladder/:hash' do
        ENDPOINTS.fetch(:metadata).(self, params, source: :oraladder)
      end

      get '/replays/data/oraladder/:hash' do
        ENDPOINTS.fetch(:data).(self, params, source: :oraladder)
      end

      get '/replays/metadata/ragl/:hash' do
        ENDPOINTS.fetch(:metadata).(self, params, source: :ragl)
      end

      get '/replays/data/ragl/:hash' do
        ENDPOINTS.fetch(:data).(self, params, source: :ragl)
      end

      error Sinatra::NotFound do
        [404, '{}']
      end

      error Openra::API::Utils::FileResolver::InvalidHashError do |error|
        [500, JSON.dump(message: error.message)]
      end

      error Openra::API::UnknownServerError do |error|
        [500, JSON.dump(message: error.message)]
      end
    end
  end
end
