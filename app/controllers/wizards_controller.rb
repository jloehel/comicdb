class WizardsController < ApplicationController
  before_action :load_comic_wizard, except: %i(validate_step)

  def validate_step
    current_step = params[:current_step]

    @comic_wizard = wizard_comic_for_step(current_step)
    @comic_wizard.comic.attributes = comic_wizard_params
    session[:comic_attributes] = @comic_wizard.comic.attributes

    if @comic_wizard.valid?
      next_step = wizard_comic_next_step(current_step)
      create and return unless next_step

      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create
    if @comic_wizard.comic.save
      session[:comic_attributes] = nil
      redirect_to root_path, notice: 'comic succesfully created!'
    else
      redirect_to({ action: Wizard::comic::STEPS.first }, alert: 'There were a problem when creating the comic.')
    end
  end

  private

  def load_comic_wizard
    @comic_wizard = wizard_comic_for_step(action_name)
  end

  def wizard_comic_next_step(step)
    Wizard::comic::STEPS[Wizard::comic::STEPS.index(step) + 1]
  end

  def wizard_comic_for_step(step)
    raise InvalidStep unless step.in?(Wizard::comic::STEPS)

    "Wizard::comic::#{step.camelize}".constantize.new(session[:comic_attributes])
  end

  def comic_wizard_params
    params.require(:comic_wizard).permit(:email, :first_name, :last_name, :address_1, :address_2, :zip_code, :city, :country, :phone_number)
  end

  class InvalidStep < StandardError; end
end
