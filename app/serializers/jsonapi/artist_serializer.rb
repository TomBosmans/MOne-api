# frozen_string_literal: true

class Jsonapi::ArtistSerializer < Jsonapi::ApplicationSerializer
  has_many :albums
  has_many :tracks

  attribute :name
end
