class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
    # @@all << self
  end

  def self.create(name)
  artist = self.new(name)
  artist.save
  artist
end

  def add_song(song) #keeps track of an artist's songs
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
  songs.collect{|song| song.genre}.uniq
  end

end
