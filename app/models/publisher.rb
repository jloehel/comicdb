class Publisher < ActiveRecord::Base
  has_many :comics
  validates_presence_of :name
end
