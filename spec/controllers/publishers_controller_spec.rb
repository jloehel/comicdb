require 'rails_helper'

RSpec.describe PublishersController, type: :controller do
  describe "POST #create" do
    let(:invalid_publisher) {
      FactoryGirl.attributes_for :publisher, {name: nil}
    }
    context "with valid attributes" do
      it "create new publisher" do
        expect do
          post :create, publisher: FactoryGirl.attributes_for(:publisher)
          expect(response.status).to eq 302
        end.to change(Publisher, :count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new publisher" do
        expect do
          post :create, publisher: invalid_publisher
          expect(response.status).to eq 200
        end.to change(Publisher, :count).by(0)
      end
    end
  end
end
