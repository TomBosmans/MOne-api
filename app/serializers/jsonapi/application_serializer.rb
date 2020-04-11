# frozen_string_literal: true

class Jsonapi::ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :camel_lower
end
