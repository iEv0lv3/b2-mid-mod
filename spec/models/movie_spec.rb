require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end
  
  describe '#young_to_old' do
    it 'should display youngest to oldest' do
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

      expect(@movie1.young_to_old.first.name).to eq('Daisy Ridley')
      expect(@movie1.young_to_old.last.name).to eq('Jon Boyega')
    end
  end

  describe '#average_age' do
    it 'should display average age' do
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

      expect(@movie1.average_age).to eq(31)
      expect(@movie2.average_age).to eq(56)
    end
  end
end
