# frozen_string_literal: true

require 'taglib'

class Sync < ApplicationService
  def initialize(path)
    @path = path
  end

  def execute
    flac_files.each(&method(:read_flac))
  end

  private

  attr_reader :path

  def flac_files
    @flac_files ||= Dir.glob("#{path}/**/*.flac")
  end

  def read_flac(path)
    TagLib::FLAC::File.open(path) do |file|
      tag = file.xiph_comment
      fields = tag.field_list_map.transform_values(&:first)
      picture = file.picture_list.first

      artist = Artist.find_or_create_by(
        name: fields['ARTIST']
      )

      album = artist.albums.find_or_create_by(
        name: fields['ALBUM'],
        release_date: fields['DATE'] && Time.zone.local(fields['DATE'])
      )

      album.tracks.find_or_create_by(
        name: fields['TITLE'],
        number: fields['TRACKNUMBER'],
        source: path
      )

      unless album.cover.attached?
        album.cover.attach(
          io: StringIO.new(picture.data),
          filename: album.id,
          content_type: picture.mime_type
        )
      end
    end
  end
end
