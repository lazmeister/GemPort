class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :location, :string
  end
end
