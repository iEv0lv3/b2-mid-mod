require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before :each do
    @studio1 = Studio.create(name: 'Disney')
    @studio2 = Studio.create(name: 'MGM')

    @movie1 = @studio1.movies.create(name: 'Star Wars',
                                      creation_year: '2019',
                                      genre: 'sci-fi')

    @movie2 = @studio2.movies.create(name: 'Lord of the Rings',
                                      creation_year: '2006',
                                      genre: 'fantasy')
  end

  describe 'When I visit an actor show page' do
    it 'I see their name, age, and list of all movies they are in' do

    end
  end
end

# Story 2
# As a user,
# When I visit an actor's show page,
# I see their name, their age, and a 
# list of the names of all of the movies they are in.