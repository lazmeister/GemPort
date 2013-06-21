class Referral < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :city, :state, :country, :description, :location, :eventdate, :coverage, :budget, :referraltype, :expirereplies, :expiredays
  belongs_to :user
  validates :user_id, presence: true
  validates :location, presence: true
  validates :referraltype, presence: true
  validates :eventdate, presence: true
  has_many :replies
  
  # geocoding
  geocoded_by :location do |referral,results|
    if geo = results.first
      referral.city = geo.city
      referral.state = geo.state_code
      referral.country = geo.country_code
      referral.longitude = geo.longitude
      referral.latitude = geo.latitude
    end
  end
  after_validation :geocode, :if => :location_changed?
  
  def nil_zero?
    self.nil? || self == 0
  end
end
