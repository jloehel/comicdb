class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def new
    @Publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new }
        format.json { render json: @publisher.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name, :describtion, :website)
  end
end
