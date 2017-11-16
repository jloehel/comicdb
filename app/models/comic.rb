class Comic < ActiveRecord::Base
  has_many :comics_has_authors
  has_many :authors, through: :comics_has_authors
  has_and_belongs_to_many :categories

  def ISBN10=(val)
    super(only_numbers val)
  end

  def ISBN13=(val)
    super(only_numbers val)
  end
end
