class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end
 
  def create
    @comic = Comic.new
    @comic.save(validate: false)
    redirect_to comic_step_path(@comic, Comic.steps.first)  
  end
end
