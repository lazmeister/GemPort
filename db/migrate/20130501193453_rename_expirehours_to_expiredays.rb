class RenameExpirehoursToExpiredays < ActiveRecord::Migration
  def up
    rename_column :referrals, :expirehours, :expiredays
  end

  def down
  end
end
