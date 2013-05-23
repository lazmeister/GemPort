class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :name, :email, :website, :location, :phone, :password, :notif_referrals, :notif_assistant, :password_confirmation, :remember_me, :provider, :uid, :image

  has_attached_file :image, styles: { medium: "320x320>", thumb: "50x50" }
  has_many :referrals
  has_many :replies, :through => :referrals
  
  def remote_ip  
    @client_ip = request.remote_ip
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email,
                    :name => data.name,
                    :image => data.image,
                    :password => Devise.friendly_token[0,20])
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
        user.name = data["name"]
        user.image = data["image"]
      end
    end
  end
end
