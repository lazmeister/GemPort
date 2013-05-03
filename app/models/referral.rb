class Referral < ActiveRecord::Base
  attr_accessible :description, :location, :eventdate, :coverage, :budget, :referraltype, :expirereplies, :expiredays
  belongs_to :user
  validates :user_id, presence: true
  validates :location, presence: true
  validates :referraltype, presence: true
  validates :eventdate, presence: true
  
  def nil_zero?
    self.nil? || self == 0
  end
end
