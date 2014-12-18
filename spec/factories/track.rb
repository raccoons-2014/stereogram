FactoryGirl.define do
  factory :track do
    user
    soundcloud_url {Faker::Internet.url}
  end
end