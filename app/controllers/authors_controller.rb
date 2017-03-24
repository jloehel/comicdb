class AuthorsController < ApplicationController
  def new
    @Author = Author.new
  end

  def create
    @author = Author.new(author_params)
    respond_to do |format|
      if @author.save
        format.html { redirect_to @author }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:surname, :lastname, :birthday, :deathday, :describtion)
  end
end
