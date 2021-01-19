class Genre < ActiveRecord::Base
  has_many :songs


  def self.genre_names
    Genre.all.map do |genre|
      genre.name
    end
  end
end
