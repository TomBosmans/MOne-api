# frozen_string_literal: true

class Jsonapi::TrackSerializer < Jsonapi::ApplicationSerializer
  belongs_to :album
  belongs_to :artist

  attribute :name
end
