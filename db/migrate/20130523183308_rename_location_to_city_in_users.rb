class RenameLocationToCityInUsers < ActiveRecord::Migration
  def up
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
