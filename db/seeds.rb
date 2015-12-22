# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create some users
    

User.create!(name:  "Example User",
                 email: "example@railstutorial.org",
                 password:              "foobar",
                 password_confirmation: "foobar",
                 admin:  true)
99.times do |n|
name = Faker::Name.name
email = "example-#{n+1}@railstutorial.org" 
password = "password"
User.create!(name: name,
                   email: email,
                   password:              password,
                   password_confirmation: password)
end


users = User.all
    user  = users.first
    following = users[2..50]
    followers = users[3..40]
    following.each { |followed| user.follow(followed) }
    followers.each { |follower| follower.follow(user) }


      user = User.find(1)
    user.microposts.create(content: "Ruby is the best")
    user.microposts.create(content: "Changed my mind, it's Java")
    user = User.find(2)
    user.microposts.create(content: "What Ruby lacks is ....")

    # Associate some tags with microposts
#TOPIC PART

    java=Topic.create(name: "Java")
    ruby=Topic.create(name: "ruby")
    android=Topic.create(name:"android")
    php=Topic.create(name:"php")

    user = User.find(1).topics<<java
    user = User.find(1).topics<<ruby
    user = User.find(1).topics<<php

    user = User.find(2).topics<<java

    user = User.find(2).topics<<php