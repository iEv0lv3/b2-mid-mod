class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def young_to_old
    actors.joins(:actor_movies).order(age: :asc)
  end

  def average_age
    # this is bad, I know
    ages = []
    actors.each do |actor|
      ages << actor.age.to_i
    end

    ages.sum / ages.size
  end
end
