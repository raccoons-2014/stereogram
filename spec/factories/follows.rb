FactoryGirl.define do
  factory :follow do
    follower_id rand(1..50)
    followed_id rand(51..101)
  end

end
