class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.username = auth['info']['name'] ||  ""
        user.token = auth['credentials']['token'] || ""
      end
    end
  end

end
