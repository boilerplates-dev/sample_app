FactoryGirl.define do
  factory :user do
    sequence(:name)  { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    sequence(:content) { Faker::Lorem.sentence }
    user
  end
end
