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
    song = self.new 
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song 
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name)|| self.create_by_name(name) 
  end
  
  def self.alphabetical
   @@all.sort_by{|song|song.name}
  end
      # song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
      # expect(song.name).to eq("For Love I Come")
      # expect(song.artist_name).to eq("Thundercat")
    
    
  def self.new_from_filename(filename)
    song = self.new
    array = filename.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song.name = array[1]
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new 
    array = filename.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song.name = array[1]
    song.artist_name = array[0]
    @@all << song
    song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
  
  
