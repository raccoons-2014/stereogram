FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    provider "facebook"
    uid "1234567"
    token "ABCDEF..."
    profile_img_url "http//:pictures.com"
  end
end