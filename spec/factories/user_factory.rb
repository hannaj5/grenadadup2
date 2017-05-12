FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    role :user
    password 'password'
    password_confirmation 'password'
    
    factory :editor do
      role :editor
    end
    
    factory :admin do
      role :admin
    end
    
  end
end
