class Referral < ActiveRecord::Base
  attr_accessible :description, :location, :eventdate, :coverage, :budget, :referraltype, :expirereplies, :expiredays
  belongs_to :user
  validates :user_id, presence: true
  validates :location, presence: true
  validates :referraltype, presence: true
  validates :eventdate, presence: true
  has_many :replies
  
  # geocoding
  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
  
  def nil_zero?
    self.nil? || self == 0
  end
end
