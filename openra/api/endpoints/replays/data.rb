# frozen_string_literal: true

module Openra
  module API
    module Endpoints
      module Replays
        class Data
          def call(response, params)
            data = Openra::Commands::Replays::ExtractData.new.call(
              params['data']['tempfile'].path
            )

            response.status(201)
            response.body(JSON.dump(data))
          rescue
            response.status(500)
            response.body(JSON.dump({}))
          end
        end
      end
    end
  end
end
