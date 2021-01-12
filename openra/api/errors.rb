# frozen_string_literal: true

module Openra
  module API
    Error = Class.new(StandardError)
    UnknownServerError = Class.new(Error)
  end
end
