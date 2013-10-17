require 'ffaker'

FactoryGirl.define do

  factory :flag do
    resource :factory => :post
  end

  factory :post do
    text Faker::Lorem.paragraphs(2)
  end

  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email {|u| Faker::Internet.email("#{u.first_name} #{u.last_name}")}
    password "password"
  end

end