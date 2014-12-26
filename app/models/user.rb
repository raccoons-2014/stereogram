class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable and :timeoutable
  include OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable,
          omniauth_providers:  [:facebook, :soundcloud]
          
  has_many :tracks
  has_many :snippets


  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth['provider']
  #     user.uid = auth['uid']
  #     if auth['info']
  #       user.first_name = auth['info']['first_name']
  #       user.last_name = auth['info']['last_name']
  #       user.profile_img_url = auth['info']['image']
  #       user.token = auth['credentials']['token']
  #     end
  #   end
  # end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
