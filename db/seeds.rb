# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create some users
    


    #MICROPOST
 # Associate some microposts with users
   User.create(name:'Justin', email:'ssswwj110@gmail.com', password: "ssswwj110", password_confirmation: "ssswwj110")
  User.create(name:'Alex', email:'jc@here.com', password: "secret", password_confirmation: "secret")
    # Associate some microposts with users
  User.create(name:'Tom', email:'ssswwj111@gmail.com', password: "secret", password_confirmation: "secret")

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
   