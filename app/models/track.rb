# frozen_string_literal: true

# == Schema Information
#
# Table name: tracks
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :uuid
#
# Indexes
#
#  index_tracks_on_album_id  (album_id)
#
# Foreign Keys
#
#  fk_rails_...  (album_id => albums.id)
#
class Track < ApplicationRecord
  belongs_to :album
  has_one :artist, through: :album
end
