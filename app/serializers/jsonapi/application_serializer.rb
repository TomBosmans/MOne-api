# frozen_string_literal: true

class Jsonapi::ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower

  class << self
    include Rails.application.routes.url_helpers
    
    def default_url_options
      ActionController::API.default_url_options
    end
  end
end
