require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the studios index page' do
    before :each do
      @studio1 = Studio.create(name: 'Disney')
      @studio2 = Studio.create(name: 'MGM')

      @movie1 = @studio1.movies.create(name: 'Star Wars')
      @movie2 = @studio2.movies.create(name: 'Lord of the Rings')

    end
    it 'I see all of the movie studios' do
      visit '/studios'

      within("div#studio_#{@studio1.id}") do
        expect(page).to have_content('Disney')
        expect(page).to have_content('Star Wars')
      end

      within("div#studio_#{@studio2.id}") do
        expect(page).to have_content('MGM')
        expect(page).to have_content('Lord of the Rings')
      end
    end

    it 'Underneath each studio I see all its movies' do

    end
  end
end

# Story 1
# As a user, 
# When I visit the studio index page
# I see a list of all of the movie studios 
# And underneath each studio, I see the names of all of its movies.