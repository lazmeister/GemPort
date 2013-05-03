class AddEventdateToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :eventdate, :date
  end
end
