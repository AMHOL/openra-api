# frozen_string_literal: true

module Openra
  module API
    module Endpoints
      module Replays
        class Metadata < Openra::API::Endpoints::Base
          def call(app, params, source:)
            file = Openra::API::Utils::FileResolver.new(source).call(params)
            data = Openra::Commands::Replays::ExtractMetadata.new.call(file.path)
            body = JSON.dump(data)

            app.response.status = app.request.get? ? 200 : 201
            app.response.body = body
          rescue => error
            if app.development?
              raise(error)
            else
              raise Openra::API::UnknownServerError, 'Unknown server error'
            end
          end
        end
      end
    end
  end
end
