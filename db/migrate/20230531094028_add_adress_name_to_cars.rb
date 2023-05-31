class AddAdressNameToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :address, :string
    add_column :cars, :name, :string
  end
end
