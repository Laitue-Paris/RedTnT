class AddUserReferencesToClothes < ActiveRecord::Migration[7.1]
  def change
    add_reference :clothes, :user
  end
end
