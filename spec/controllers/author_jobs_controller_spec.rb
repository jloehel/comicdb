require 'rails_helper'

RSpec.describe AuthorJobsController, type: :controller do
  describe "POST #create" do
    let(:invalid_author_job) {
      FactoryGirl.attributes_for :author_job, {name: nil}
    }
    context "with valid attributes" do
      it "create new author_job" do
        expect do
          post :create, author_job: FactoryGirl.attributes_for(:author_job)
          expect(response.status).to eq 302
        end.to change(AuthorJob, :count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new author_job" do
        expect do
          post :create, author_job: invalid_author_job
          expect(response.status).to eq 200
        end.to change(AuthorJob, :count).by(0)
      end
    end
  end
end
