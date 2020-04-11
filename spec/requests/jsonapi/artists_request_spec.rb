# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jsonapi::Artists', type: :request do
  let(:headers) do
    {
      'Content-Type' => 'application/vnd.api+json'
    }
  end

  describe 'GET #index' do
    it 'returns list of artists' do
      create_list :artist, 3
      get jsonapi_artists_url, headers: headers
      ids = JSON.parse(response.body)['data'].map { |hash| hash['id'] }
      expect(ids).to eq Artist.ids
    end
  end

  describe 'GET #show' do
    it 'returns given artist' do
      artist = create :artist
      get jsonapi_artist_url(artist), headers: headers
      data = JSON.parse(response.body)['data']
      expect(data).to include('id' => artist.id.to_s, 'type' => 'artist')
    end
  end
end
