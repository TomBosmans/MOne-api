# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums, id: :uuid do |t|
      t.references :artist, type: :uuid, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
