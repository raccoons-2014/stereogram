class User < ActiveRecord::Base

  has_many :votes
  devise :database_authenticatable, :rememberable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :tracks
  has_many :snippets

  has_many :follows, :foreign_key => "follower_id"
  has_many :following, :through => :follows, :source => :followed

  has_many :reverse_follows, :foreign_key => "followed_id",
                             :class_name => "Follow"
  has_many :followers, :through => :reverse_follows, :source => :follower

  before_create :remember

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.email = auth['info']['email']
      user.profile_img_url = auth['info']['image']
      user.token = auth['credentials']['token']
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def link_soundcloud_account(auth)
    self.sound_cloud_id = auth['id']
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def is_following?(followed)
    follows.find_by_followed_id(followed)
  end

  def follow(followed)
    follows.create(:followed_id => followed.id)
  end

  def unfollow(followed)
    follows.find_by_followed_id(followed).destroy
  end

  def remember
    self.remember_created_at = DateTime.now
  end

end
