FactoryGirl.define do
  factory :snippet do
    track
    user
    start_time {rand(1..10).to_s}
    end_time {rand(1..10).to_s}
  end
end