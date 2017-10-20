FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User #{n}"
    end
    sequence :email do |n|
      "user-#{n}@example.com"
    end
    password 'password'
    password_confirmation 'password'
    initialize_with { User.find_or_create_by(email: email) }

    factory :michael do
      name 'Michael Example'
      email 'michael@example.com'
      password_digest User.digest('password')
    end
  end
end
