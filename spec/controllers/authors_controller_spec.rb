require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe "POST #create" do
    let(:invalid_author) {
      FactoryGirl.attributes_for :author, {lastname: nil}
    }
    context "with valid attributes" do
      it "create new author" do
        expect do
          post :create, author: FactoryGirl.attributes_for(:author)
          expect(response.status).to eq 302
        end.to change(Author, :count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new author" do
        expect do
          post :create, author: invalid_author
          expect(response.status).to eq 200
        end.to change(Author, :count).by(0)
      end
    end
  end
end
