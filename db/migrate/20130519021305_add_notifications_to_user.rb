class AddNotificationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :notif_referrals, :boolean
    add_column :users, :notif_assistant, :boolean
  end
end
