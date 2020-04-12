# frozen_string_literal: true

# == Schema Information
#
# Table name: tracks
#
#  id         :uuid             not null, primary key
#  name       :string
#  number     :integer
#  source     :string
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
require 'rails_helper'

RSpec.describe Track, type: :model do
  it { is_expected.to belong_to :album }
  it { is_expected.to have_one(:artist).through(:album) }
end
