FactoryGirl.define do
  factory :track do
    user
    soundcloud_track_id {rand(1..1000)}
  end
end