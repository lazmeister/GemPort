class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :image
  validates_attachment :image, presence: true,
                        content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                        size: { less_than: 2.megabytes }
  has_attached_file :image, styles: { medium: "320x240>"}
  has_many :referrals
  
  def self.find_for_facebook_oauth(omniauth)
    if user = User.find_by_email(omniauth.info.email)
      if omniauth.info.image.present?
        user.update_attribute(:image, omniauth.info.image)
      end
      user
    else # Create a user with a stub password. 
      User.create!(:email => omniauth.info.email,
                   :name => omniauth.info.name,
                   :image => omniauth.info.image,
                   :password => Devise.friendly_token[0,20])
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if omniauth = session["devise.facebook_data"]
        user.email = omniauth.info.email
        user.name = omniauth.info.name
        user.image = omniauth.info.image
      end
    end
  end
end
