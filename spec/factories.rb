require 'ffaker'

FactoryGirl.define do

  factory :post do
    text Faker::Lorem.paragraphs(2)
  end

end