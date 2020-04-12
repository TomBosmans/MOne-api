# frozen_string_literal: true

class Jsonapi::AlbumSerializer < Jsonapi::ApplicationSerializer
  belongs_to :artist
  has_many :tracks

  attributes :name, :release_date

  attribute :cover do |album|
    url_for album.cover if album.cover.attached?
  end
end
