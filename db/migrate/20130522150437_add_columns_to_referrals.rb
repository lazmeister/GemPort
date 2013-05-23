class AddColumnsToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :latitude, :float
    add_column :referrals, :longitude, :float
  end
end
