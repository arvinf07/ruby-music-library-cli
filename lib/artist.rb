

class Artist < Song
  attr_reader :songs
  extend Concerns::Findable
  
  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song) 
  end  

  def genres
    @songs.collect {|song| song.genre}.uniq
  end  



end  