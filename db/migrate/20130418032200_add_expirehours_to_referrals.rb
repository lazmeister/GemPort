class AddExpirehoursToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :expirehours, :integer
  end
end
