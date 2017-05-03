class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    render("/movies/show.html.erb")
  end

  def new_form
    render("/movies/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save
    render("show.html.erb")
  end

  def edit_form
    @movie = Movie.find(params[:id])
    @title = @movie.title
    @year = @movie.year
    @duration = @movie.duration
    @description = @movie.description
    @image_url = @movie.image_url
    @director_id = @movie.director_id
    render("/movies/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find(params[:id])
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save
    redirect_to("/movies")
  end

  def destroy
    @the_id = params[:id]
    deleted_movie = Movie.find(@the_id)
    deleted_movie.destroy
    redirect_to("/movies")
  end
end
