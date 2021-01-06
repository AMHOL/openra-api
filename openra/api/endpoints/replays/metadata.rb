# frozen_string_literal: true

module Openra
  module API
    module Endpoints
      module Replays
        class Metadata
          def call(response, file)
            data = Openra::Commands::Replays::ExtractMetadata.new.call(file.path)

            response.status(201)
            response.body(JSON.dump(data))
          rescue
            response.status(500)
            response.body(JSON.dump(message: 'Unknown server error'))
          end
        end
      end
    end
  end
end
