require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    #initializes a song and saves it to @@all
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    search_result = self.find_by_name(song_name)
    search_result ? search_result : self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end

  def self.new_from_filename(file_name)
    # "Taylor Swift - Blank Space.mp3"
    song_file = file_name.delete_suffix!('.mp3').split(" - ")
      artist_name = song_file[0]
      name = song_file[1]
      song = Song.new
      song.name = name
      song.artist_name = artist_name
      song
  end

  def self.create_from_filename(file_name)
    # "Taylor Swift - Blank Space.mp3"
    song_file = file_name.delete_suffix!('.mp3').split(" - ")
      artist_name = song_file[0]
      name = song_file[1]
      song = Song.new
      song.name = name
      song.artist_name = artist_name
      song.save
      song
  end

  def self.destroy_all
    self.all.clear
  end 

end
