class AddCityAndStateAndCountryToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :city, :string
    add_column :referrals, :state, :string
    add_column :referrals, :country, :string
  end
end
