class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def notes_1=(content)
      self.notes << Note.new(content: content)
  end

  def notes_2=(content)
    self.notes << Note.new(content: content)
  end

  def notes_1
    if !self.notes.all.empty?
      self.notes.first
    end
  end

  def notes_2
    if !self.notes.all.empty?
      self.notes[1]
    end
  end

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id
    self.genre.id if self.genre
  end

  def genre_id=(genre_name)
    Genre.find_by(name: genre_name).songs << self
  end


end
