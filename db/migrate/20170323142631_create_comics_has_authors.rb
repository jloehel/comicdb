class CreateComicsHasAuthors < ActiveRecord::Migration
  def change
    create_table :comics_has_authors do |t|
      t.references :author, index: true, foreign_key: true
      t.references :comic, index: true, foreign_key: true
      t.references :author_job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
