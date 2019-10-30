class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)

    return song if song

    create_by_name(name)
  end

  def self.alphabetical
    all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    artist_name, name = filename.split(' - ')
    song = new_by_name(name.split('.')[0])
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end
