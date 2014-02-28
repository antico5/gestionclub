# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "testuser@gmail.com"
    password "testpass"
  end
end
