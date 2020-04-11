# frozen_string_literal: true

class Jsonapi::AlbumSerializer < Jsonapi::ApplicationSerializer
  belongs_to :artist
  has_many :tracks

  attribute :name
  attribute :cover do |album|
    url_for album.cover
  end
end
