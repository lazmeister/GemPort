class RenameTypeToReferraltype < ActiveRecord::Migration
  def up
      rename_column :referrals, :type, :referraltype
    end
    
  end

  def down
  end
end
