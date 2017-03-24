require 'rails_helper'

RSpec.describe Author, type: :model do
  it "has a valid factory" do
      expect { Factory.build(:author).to be_valid }
  end
  it { is_expected.to validate_presence_of(:surname) }
  it { is_expected.to validate_presence_of(:lastname) }
end
