class AddUserIdToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :user_id, :integer
    add_index :referrals, :user_id
  end
end
