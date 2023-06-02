class RemoveDefaultValueToPhotoCars < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cars, :photo, nil
  end
end
