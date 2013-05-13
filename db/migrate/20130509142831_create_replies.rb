class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :user
      t.references :referral

      t.timestamps
    end
    add_index :replies, :user_id
    add_index :replies, :referral_id
  end
end
