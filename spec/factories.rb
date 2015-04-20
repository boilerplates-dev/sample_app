FactoryGirl.define do
  factory :user do
    sequence(:name)  { FFaker::Name.name }
    sequence(:email) { FFaker::Internet.email }
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    sequence(:content) { FFaker::Lorem.sentence }
    user
  end
end
