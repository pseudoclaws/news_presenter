FactoryGirl.define do
  factory :piece_of_news do
    title Faker::Lorem.paragraph
    description Faker::Lorem.paragraph
    published_at Time.now

    factory :authorized_piece_of_news do
      authorized true
      valid_until 1.day.since(Time.now)
    end
  end
end