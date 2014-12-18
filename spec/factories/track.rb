FactoryGirl.define do
  factory :track do
    soundcloud_url {Faker::Internet.url}
    user
  end
end