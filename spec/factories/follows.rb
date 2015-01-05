FactoryGirl.define do
  factory :follow do
    follower_id 1 # not a fan of hard-coding ids.  You can get around this by using https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#associations
    followed_id 1
  end

end
