class AddForeignKeyToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :characters, :users
  end
end
