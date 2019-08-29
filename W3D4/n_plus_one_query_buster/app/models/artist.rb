class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    # TODO: your code here
    # Because I am counting tracks in an album I should use joins (aggregation)
    albums_with_track_counts = self
      .albums
      .select("albums.title, COUNT(*) AS track_counts")
      .joins(:tracks)
      .group("albums.id")

    albums_with_track_counts.map do |album|
      [album.title, album.track_counts]
    end

  end
end
