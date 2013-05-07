class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

  has_many :responses
  has_many :questions, through: :responses
  has_many :questions

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  #Will use this to add Twitter OAuth authentication
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    # user = User.where(:provider => auth.provider, :uid => auth.uid).first
    # if user
    #   return user
    # else
    #   registered_user = User.where(:email => auth.uid + "@twitter.com").first
    #   if registered_user
    #     return registered_user
    #   else
    #     user = User.create(name:auth.info.name,
    #       provider:auth.provider,
    #       uid:auth.uid,
    #       email:auth.uid+"@twitter.com",
    #       password:Devise.friendly_token[0,20],
    #     )
    #   end
    # end
  end
end