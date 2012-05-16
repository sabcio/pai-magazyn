class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :photo_url
      t.integer :stock
      t.decimal :price

      t.timestamps
    end
  end
end
