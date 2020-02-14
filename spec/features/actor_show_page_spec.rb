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

    @actor2 = @movie2.actors.create(name: 'Elijah Wood',
                                    age: '38')
  end

  describe 'When I visit an actor show page' do
    it 'I see their name, age, and list of all movies they are in' do
      visit "/actors/#{@actor1.id}"

      expect(page).to have_content('Daisy Ridley')
      expect(page).to have_content('30')
      expect(page).to have_content('Star Wars')

      visit "/actors/#{@actor2.id}"

      expect(page).to have_content('Elijah Wood')
      expect(page).to have_content('Lord of the Rings')
      expect(page).to have_content('38')
    end
  end
end
