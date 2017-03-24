class Author < ActiveRecord::Base
  has_many :comics_has_authors
  has_many :comics, through: :comics_has_authors 
  validates_presence_of :lastname, :surname
end
