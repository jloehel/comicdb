class AuthorJobsController < ApplicationController
  def new
    @AuthorJob = AuthorJob.new
  end

  def create
    @author_job = AuthorJob.new(author_params)
    respond_to do |format|
      if @author_job.save
        format.html { redirect_to @author_job }
        format.json { render :show, status: :created, location: @author_job }
      else
        format.html { render :new }
        format.json { render json: @author_job.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def author_params
    params.require(:author_job).permit(:name)
  end
end
