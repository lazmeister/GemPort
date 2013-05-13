class AddEmailToRefferalReplies < ActiveRecord::Migration
  def change
    add_column :referral_replies, :email, :string
  end
end
