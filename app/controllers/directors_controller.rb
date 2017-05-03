class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    render("/directors/show.html.erb")
  end

  def new_form
    render("/directors/new_form.html.erb")
  end

  def create_row
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("show.html.erb")
  end

  def edit_form
    @director = Director.find(params[:id])
    @bio = @director.bio
    @dob = @director.dob
    @name = @director.name
    @image_url = @director.image_url
    render("/directors/edit_form.html.erb")
  end

  def update_row
    @director = Director.find(params[:id])

    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    redirect_to("/directors")
  end

  def destroy
    @the_id = params[:id]
    deleted_director = Director.find(@the_id)
    deleted_director.destroy
    redirect_to("/directors")
  end
end
