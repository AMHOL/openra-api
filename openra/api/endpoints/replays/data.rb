# frozen_string_literal: true

module Openra
  module API
    module Endpoints
      module Replays
        class Data
          def call(response, file)
            data = Openra::Commands::Replays::ExtractData.new.call(file.path)

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
