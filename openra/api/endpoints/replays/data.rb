# frozen_string_literal: true

module Openra
  module API
    module Endpoints
      module Replays
        class Data < Openra::API::Endpoints::Base
          def call(app, params, source:)
            body = with_caching_switch(cache?(source), cache_key(source, params)) do
              file = Openra::API::Utils::FileResolver.new(source).call(params)
              data = Openra::Commands::Replays::ExtractData.new.call(file.path)

              JSON.dump(data)
            end

            app.response.status = app.request.get? ? 200 : 201
            app.response.body = body
          rescue => error
            if app.development?
              raise(error)
            else
              raise Openra::API::UnknownServerError, 'Unknown server error'
            end
          end

          private

          def cache?(source)
            %i(oraladder ragl).include?(source)
          end

          def cache_key(source, params)
            [source, params['hash']].join('-')
          end
        end
      end
    end
  end
end
