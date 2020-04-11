# frozen_string_literal: true

# == Schema Information
#
# Table name: albums
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :uuid
#
# Indexes
#
#  index_albums_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#
class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks
end
