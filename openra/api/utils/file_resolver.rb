# frozen_string_literal: true

require 'open-uri'

module Openra
  module API
    module Utils
      class FileResolver
        InvalidHashError = Class.new(StandardError)
        SOURCES = {
          upload: ->(params) { params['data']['tempfile'] },
          oraladder: ->(params) {
            URI.open("http://oraladder.net/replay/#{params[:hash]}")
          },
          ragl: ->(params) {
            URI.open("http://ragl.org/replay/#{params[:hash]}")
          }
        }.freeze

        attr_reader :source
        private :source

        def initialize(source)
          @source = source
        end

        def call(params)
          SOURCES.fetch(source).call(params)
        rescue OpenURI::HTTPError
          raise InvalidHashError, "Invalid hash: '#{params[:hash]}'"
        end
      end
    end
  end
end
