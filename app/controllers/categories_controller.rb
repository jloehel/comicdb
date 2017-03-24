class CategoriesController < ApplicationController
  def new
    @Category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category }
        format.json { render :show, status: :created, location: @category}
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unproccessable_entity}
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
