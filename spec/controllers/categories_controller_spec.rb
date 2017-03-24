require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "POST #create" do
    let(:invalid_category) {
      FactoryGirl.attributes_for :category, {name: nil}
    }
    context "with valid attributes" do
      it "create new category" do
        expect do
          post :create, category: FactoryGirl.attributes_for(:category)
          expect(response.status).to eq 302
        end.to change(Category, :count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new category" do
        expect do
          post :create, category: invalid_category
          expect(response.status).to eq 200
        end.to change(Category, :count).by(0)
      end
    end
  end
end
