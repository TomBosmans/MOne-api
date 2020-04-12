# frozen_string_literal: true

# == Schema Information
#
# Table name: albums
#
#  id           :uuid             not null, primary key
#  name         :string
#  release_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  artist_id    :uuid
#
# Indexes
#
#  index_albums_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#
FactoryBot.define do
  factory :album do
    artist
    name { Faker::Music.album }
  end
end
