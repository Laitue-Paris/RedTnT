class CreateClothes < ActiveRecord::Migration[7.1]
  def change
    create_table :clothes do |t|
      t.string :name
      t.string :color
      t.integer :price
      t.string :size
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
