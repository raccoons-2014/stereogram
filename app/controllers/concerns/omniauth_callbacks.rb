module OmniauthCallbacks
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do
      has_many :omniauths, dependent: :destroy

      def self.find_or_create_by_omniauth(auth)
        unless user = User.find_by_omniauth(auth)
          unless user = User.find_by_email(auth.info.email)
            user = User.create_by_omniauth(auth)
          end
          user.bind_omniauth_service(auth)
        end
        user
      end

      def self.find_by_omniauth(auth)
        includes(:omniauths).where(omniauths: {provider: auth.provider, uid: auth.uid.to_s}).first
      end

      def self.create_by_omniauth(auth)
        User.create do |user|
          user.provider = auth.provider
          user.uid = auth.uid

          if auth.info
            user.first_name      = auth.info.first_name
            user.last_name       = auth.info.last_name
            user.email           = auth.info.email
            user.profile_img_url = auth.info.image
            user.token           = auth.credentials.token
            user.password        = Devise.friendly_token[0,20]
            user.confirmed_at    = Time.now
          end
        end
      end

      def bind_omniauth_service(auth)
        Omniauth.create do |omniauth|
          omniauth.user_id  = id
          omniauth.provider = auth.provider
          omniauth.uid      = auth.uid
          omniauth.image    = auth.info.image
          omniauth.url      = auth.info.urls.Facebook if auth.provider == 'facebook'
          omniauth.url      = auth.info.website if auth.provider == 'soundcloud'
        end
      end
    end
  end
end
