class AddBudgetToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :budget, :integer
  end
end
