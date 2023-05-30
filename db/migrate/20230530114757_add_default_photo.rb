class AddDefaultPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :photo, :string, default: "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg"
  end
end
