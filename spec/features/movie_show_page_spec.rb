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

    @actor1 = @movie1.actors.create(name: 'Daisy Ridley',
                                    age: '30')

    @actor2 = @movie1.actors.create(name: 'Jon Boyega',
                                    age: '32')

    @actor3 = @movie2.actors.create(name: 'Elijah Wood',
                                    age: '38')

    @actor4 = @movie2.actors.create(name: 'Ian Mcellan',
                                    age: '75')
  end
  describe 'When I visit a movie show page' do
    it 'I see the movie name, creation year, and genre' do
      visit "/movies/#{@movie1.id}"

      expect(page).to have_content(@movie1.name)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)

      visit "/movies/#{@movie2.id}"

      expect(page).to have_content(@movie2.name)
      expect(page).to have_content(@movie2.creation_year)
      expect(page).to have_content(@movie2.genre)
    end

    it 'I see the actors from youngest to oldest' do

    end

    it 'I see the average age of all the movie actors' do

    end
  end
end

# Story 3
# As a user, 
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre, 
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors 