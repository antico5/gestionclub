# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: User do
    email "testuser@gmail.com"
    password "testpass"
    confirmed_at DateTime.now
    association :rol, factory: :admin
  end

  factory :new_user, class: User do
    email "testuser@gmail.com"
    password "testpass"
    confirmed_at DateTime.now
  end
end
