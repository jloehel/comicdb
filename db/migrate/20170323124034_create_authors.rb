class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :surname
      t.string :lastname
      t.date :birthday
      t.date :deathday
      t.text :description

      t.timestamps null: false
    end
  end
end
