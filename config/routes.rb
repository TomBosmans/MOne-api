# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :jsonapi do
    json_api_resources :artists, only: %w[index show] do
      json_api_many :albums, only: %w[index show], set_relationship: false
    end

    json_api_resources :albums, only: %w[index show] do
      json_api_many :tracks, only: %w[index show], set_relationship: false
      json_api_many :artists, only: %w[index show], set_relationship: false
    end

    json_api_resources :tracks, only: %w[index show] do
      json_api_one :artist, only: %w[show], set_relationship: false
      json_api_one :album, only: %w[show], set_relationship: false
    end
  end
end
