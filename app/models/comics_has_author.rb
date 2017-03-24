class ComicsHasAuthor < ActiveRecord::Base
  belongs_to :author
  belongs_to :comic
  belongs_to :author_job
end
