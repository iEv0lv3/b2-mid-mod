class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.actors.create(name: params[:name])
  end
end
