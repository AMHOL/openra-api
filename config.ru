# frozen_string_literal: true

require_relative 'config/environment'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i(get delete options patch post put)
  end
end

run Openra::API::Application
