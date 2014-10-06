class AddLongLatToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :long, :float
    add_column :restaurants, :lat, :float
  end
end
