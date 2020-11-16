

class Genre < Song

  attr_reader :songs
  extend Concerns::Findable


  def initialize(name)
    super
    @songs = []
  end  

  def artists
    @songs.collect {|song| song.artist}.uniq
  end  

end  