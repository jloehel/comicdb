class Comic < ActiveRecord::Base
  has_many :comics_has_authors
  has_many :authors, through: :comics_has_authors
  has_and_belongs_to_many :categories
  validates_presence_of :ISBN13, :ISBN10, :title
end
