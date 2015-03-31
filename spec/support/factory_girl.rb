require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :restaurant do
    sequence(:name) {|n| "Restaurant#{n}" }
    street_address "1 Street Name"
    city "Boston"
    state "MA"
    zip_code "02142"
    description "pretty cool place to eat"
    phone "123456789"
    reservations true
    delivery false
  end

  factory :review do
    body 'great place'
    rating '5'
    restaurant
    user
  end

end

