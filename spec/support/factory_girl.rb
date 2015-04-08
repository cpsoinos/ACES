require "factory_girl"

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"

    factory :user_with_photo do
      avatar Rack::Test::UploadedFile.new(
        "#{Rails.root}/spec/fixtures/images/dan.jpg"
      )
    end
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
    user
  end

  factory :review do
    body "great place"
    rating "5"
    restaurant
    user
  end

  factory :vote do
    user
    review
  end

end
