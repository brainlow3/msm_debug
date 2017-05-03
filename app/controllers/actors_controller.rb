class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new_form
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    @actor = Actor.find(params[:id])
    @dob = @actor.dob
    @name = @actor.name
    @bio = @actor.bio
    @image_url = @actor.image_url
    render("/actors/edit_form.html.erb")
  end

  def update_row
    @actor = Actor.find(params[:id])

    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    redirect_to("/actors")
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    redirect_to("/actors")
  end
end
