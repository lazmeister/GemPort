class AddCoverageToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :coverage, :string
  end
end
