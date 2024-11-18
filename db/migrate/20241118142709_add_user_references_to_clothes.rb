class AddUserReferencesToClothes < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :clothes, :user
  end
end
