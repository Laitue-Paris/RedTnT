class ChangeAvailableAsFalse < ActiveRecord::Migration[7.1]
  def change
    change_column :clothes, :available, :boolean, default: :false
  end
end