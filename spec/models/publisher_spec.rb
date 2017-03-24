require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it "has a valid factory" do
      expect { Factory.build(:publisher).to be_valid }
  end
  it { is_expected.to validate_presence_of(:name) }
end
