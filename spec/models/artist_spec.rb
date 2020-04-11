# frozen_string_literal: true

# == Schema Information
#
# Table name: artists
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { is_expected.to have_many :albums }
  it { is_expected.to have_many(:tracks).through(:albums) }
end
