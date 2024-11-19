class AddForeignKeyToClothes < ActiveRecord::Migration[7.1]
  def change
    remove_reference :clothes, :user
    add_reference :clothes, :user, foreign_key: true
  end
end
