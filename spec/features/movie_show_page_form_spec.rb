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
    it 'there is a form to enter an actors name' do
      visit "/movies/#{@movie1.id}"

      fill_in :name, with: 'Elijah Wood'
      click_button 'Add Actor'

      expect(current_path).to eq("/movies/#{@movie1.id}")
      expect(page).to have_content('Elijah Wood')
    end
  end
end
