class AddForeignKeyForInventories < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :inventories, :characters
  end
end
