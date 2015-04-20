# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Bin Huang',
            email: 'huangbin88@foxmail.com',
            password: 'foobar',
            password_confirmation: 'foobar')

User.create(name: 'Example User',
            email: 'example@railstutorial.org',
            password: 'foobar',
            password_confirmation: 'foobar')

100.times do
  User.create(name: FFaker::Name.name,
              email: FFaker::Internet.email,
              password: 'foobar',
              password: 'foobar')
end

User.limit(6).each do |user|
  50.times { user.microposts.create(content: FFaker::Lorem.sentence) }
end

users = User.all
user  = users.first
followed_users = users[2..50]
followers      = users[3..40]
followed_users.each { |followed| user.follow!(followed) }
followers.each      { |follower| follower.follow!(user) }
