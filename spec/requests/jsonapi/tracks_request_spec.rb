# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jsonapi::Tracks', type: :request do
  let(:headers) do
    {
      'Content-Type' => 'application/vnd.api+json'
    }
  end

  describe 'GET #index' do
    it 'returns list of tracks' do
      create_list :track, 3
      get jsonapi_tracks_url, headers: headers
      ids = JSON.parse(response.body)['data'].map { |hash| hash['id'] }
      expect(ids).to eq Track.ids
    end
  end

  describe 'GET #show' do
    it 'returns given track' do
      track = create :track
      get jsonapi_track_url(track), headers: headers
      data = JSON.parse(response.body)['data']
      expect(data).to include('id' => track.id.to_s, 'type' => 'track')
    end
  end
end
