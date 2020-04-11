# frozen_string_literal: true

class Jsonapi::AlbumSerializer < Jsonapi::ApplicationSerializer
  belongs_to :artist
  has_many :tracks

  attribute :name
end
