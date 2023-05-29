class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :title
      t.text :photo
      t.text :description
      t.integer :price
      t.string :motor
      t.string :fuel
      t.string :brand
      t.integer :year
      t.string :modele
      t.integer :power
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
