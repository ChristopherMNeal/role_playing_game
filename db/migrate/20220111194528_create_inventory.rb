class CreateInventory < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.column(:item, :string)
      t.column(:character_id, :integer)
      t.column(:quantity, :integer)
    end
  end
end
