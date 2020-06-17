require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end 
  
  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) == nil
      create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end 
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 
  
  def self.new_from_filename(song_name)
    new_song = self.new
    song_array = song_name.split("-")
    new_song.artist_name = song_array[0].strip
    new_song.name = song_array[1].strip[0..song_array[1].strip.length-5]
    new_song
  end 
  
  def self.create_from_filename(song_name)
    new_song = new_from_filename(song_name)
    new_song.save
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all = []
  end 

end
