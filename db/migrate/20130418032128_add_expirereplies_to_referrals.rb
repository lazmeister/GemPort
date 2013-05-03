class AddExpirerepliesToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :expirereplies, :integer
  end
end
