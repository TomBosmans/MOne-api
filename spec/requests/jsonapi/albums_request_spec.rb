# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jsonapi::Albums', type: :request do
  let(:headers) do
    {
      'Content-Type' => 'application/vnd.api+json'
    }
  end

  describe 'GET #index' do
    it 'returns list of albums' do
      create_list :album, 3
      get jsonapi_albums_url, headers: headers
      ids = JSON.parse(response.body)['data'].map { |hash| hash['id'] }
      expect(ids).to eq Album.ids
    end
  end

  describe 'GET #show' do
    it 'returns given album' do
      album = create :album
      get jsonapi_album_url(album), headers: headers
      data = JSON.parse(response.body)['data']
      expect(data).to include('id' => album.id.to_s, 'type' => 'album')
    end
  end
end
