require 'rails_helper'

describe ComicsController, type: :controller do
  describe "POST #create" do
    let(:invalid_comic) {
      FactoryGirl.attributes_for :comic, {ISBN10: nil}
    }
    context "with valid attributes" do
      it "create new comic" do
        expect do
          post :create, comic: FactoryGirl.attributes_for(:comic)
          expect(response.status).to eq 302
        end.to change(Comic, :count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new comic" do
        expect do
          post :create, comic: invalid_comic
          expect(response.status).to eq 200
        end.to change(Comic, :count).by(0)
      end
    end
  end
end



