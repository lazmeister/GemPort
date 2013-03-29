class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :description

      t.timestamps
    end
  end
end
