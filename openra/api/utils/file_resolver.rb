# frozen_string_literal: true

require 'open-uri'

module Openra
  module API
    module Utils
      class FileResolver
        SOURCES = {
          upload: ->(params) { params['data']['tempfile'] },
          oraladder: ->(params) {
            URI.open("http://oraladder.net/replay/#{params[:hash]}")
          },
          ragl: ->(params) {
            URI.open("http://ragl.org/replay/#{params[:hash]}")
          }
        }
        def call(source, params)
          SOURCES.fetch(source).call(params)
        end
      end
    end
  end
end
