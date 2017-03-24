class CreateAuthorJobs < ActiveRecord::Migration
  def change
    create_table :author_jobs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
