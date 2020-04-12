# frozen_string_literal: true

class Jsonapi::TrackSerializer < Jsonapi::ApplicationSerializer
  belongs_to :album
  belongs_to :artist

  attributes :name, :number, :source
end
