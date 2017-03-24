require 'rails_helper'

describe Comic do
  it "has a valid factory" do
      expect { Factory.build(:comic).to be_valid }
  end
  it { is_expected.to validate_presence_of(:ISBN10) }
  it { is_expected.to validate_presence_of(:ISBN13) }
  it { is_expected.to validate_presence_of(:title) }
end
