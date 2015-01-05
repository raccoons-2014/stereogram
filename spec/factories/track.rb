FactoryGirl.define do
  factory :track do
    user
    source_id {rand(1..1000)}
    permalink_url Faker::Internet.url
    artwork_url Faker::Internet.url
    waveform_url Faker::Internet.url
    description Faker::Lorem.paragraph
    duration {rand(1..1000)}
    bpm {rand(1..200)}
  end
end