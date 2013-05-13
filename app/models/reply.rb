class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :referral
  attr_accessible :referral_id, :user_id
end
