class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :ISBN13
      t.string :ISBN10
      t.string :title
      t.date :release_date
      t.integer :edition
      t.string :language
      t.string :format
      t.string :shape
      t.integer :pages
      t.decimal :price
      t.text :description
      t.boolean :borrowed

      t.timestamps null: false
    end
  end
end
