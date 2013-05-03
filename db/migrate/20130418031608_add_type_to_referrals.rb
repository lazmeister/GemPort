class AddTypeToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :type, :string
  end
end
