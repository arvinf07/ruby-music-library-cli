require 'pry'


class Song 
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end  

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre = genre unless genre == nil 
  end
  
  def save 
    @@all << self
  end  

  def self.create(name)
    self.new(name).save
    @@all.last
  end  

  def self.all
    @@all
  end  

  def self.destroy_all
    @@all.clear
  end  

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end  

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).class == self
      self.find_by_name(name) 
    else
      self.create(name)
    end  
  end

  def self.new_from_filename(filename)
    new_artist = Artist.new(filename.split('-')[0].strip)
    new_genre = Genre.new(filename.split('-')[2].strip.slice(0, 5))
    new_song = self.new(filename.split('-')[1].strip, new_artist, new_genre)
  end  



end
