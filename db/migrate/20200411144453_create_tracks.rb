# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks, id: :uuid do |t|
      t.references :album, type: :uuid, index: true, foreign_key: true
      t.string :name
      t.integer :number
      t.string :source

      t.timestamps
    end
  end
end
