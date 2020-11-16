

class MusicImporter

  attr_reader :path

  def initialize(file)
    @path = file
  end

  def files
    @files || Dir[path + "**/*.mp3"].collect{|file| file.gsub(/.*\//, "")}  
  end  



end
