class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.column(:name, :string)
      t.column(:attack_liklihood, :integer)
    end
  end
end
