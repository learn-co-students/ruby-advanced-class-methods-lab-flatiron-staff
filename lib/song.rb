require 'pry'

class Song
  attr_accessor :name, :song_name, :artist_name, :song


  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    return song
  end


  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    return song
  end

  def self.find_by_name(song_name)
    self.all.find {|song_name_e| song_name_e.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by! {|s| s.name}
  end

  #split the file up into the two things, first thing is song name, second is artist

  def self.new_from_filename(filename)

    song = self.new
    @artist_name = "#{filename}".split(" - ")[0]
    @name = self.new_by_name("#{filename}".split(" - ")[1].chomp(".mp3"))
    @artist_name
    @name

  end

  def self.destroy_all
    @@all.clear
  end


end
