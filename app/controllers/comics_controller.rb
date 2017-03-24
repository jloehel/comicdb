class ComicsController < ApplicationController
  def new
    @Comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:ISBN13, :ISBN10, :title)
  end
end
