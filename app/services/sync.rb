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
    @files ||= Dir.glob("#{path}/**/*.flac")
  end

  def read_flac(path)
    TagLib::FLAC::File.open(path) do |file|
      tag = file.xiph_comment
      fields = tag.field_list_map
      create_data(fields)
    end
  end

  def create_data(fields)
    artist = Artist.find_or_create_by(name: fields['ARTIST'].first)
    album = artist.albums.find_or_create_by(name: fields['ALBUM'].first)
    track = album.tracks.create(name: fields['TITLE'].first)
  end
end
