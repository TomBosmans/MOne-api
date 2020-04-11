# frozen_string_literal: true

module Jsonapi::Resources
  extend ActiveSupport::Concern

  included do
    include Jaf::Resources
  end
end
