# frozen_string_literal: true

module Openra
  module API
    module Endpoints
      class Base
        attr_reader :cache
        private :cache

        def initialize(cache)
          @cache = cache
        end

        private

        def with_caching_switch(switch, key)
          return cache.fetch_or_store(key) { yield } if switch

          yield
        end
      end
    end
  end
end
