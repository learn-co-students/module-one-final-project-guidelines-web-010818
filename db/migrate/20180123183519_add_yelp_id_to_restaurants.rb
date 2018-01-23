class AddYelpIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :yelp_id, :string
  end
end
