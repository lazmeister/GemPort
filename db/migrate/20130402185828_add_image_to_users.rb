class AddImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :binary, :limit => 1.megabytes
  end
end
