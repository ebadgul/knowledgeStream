# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



    user = User.create(name:'Ebad Gul', email:'ebadgul66@gmail.com', password: "secret", password_confirmation: "secret")
    post = user.posts.create(title: "this is for post one", description: "this is frist post description")
    post.comments.create(comment: "this is first comment", user: user)
    
    user = User.create(name:'Dave Doe', email:'jc@here.com', password: "secret1", password_confirmation: "secret1")
    post = user.posts.create(title: "this is for post two", description: "this is second post description")
    post.comments.create(comment: "this is second comment", user: user)
    
    user = User.create(name:'jim smith', email:'js@here.com', password: "secret2", password_confirmation: "secret2")
    post = user.posts.create(title: "this is for post three", description: "this is third post description")
    post.comments.create(comment: "this is third comment", user: user)
    
    user = User.create(name:'Sam Save', email:'samesave@gmail.com', password: "secret3", password_confirmation: "secret3")
    post = user.posts.create(title: "this is for post four", description: "this is fourth post description")
    post.comments.create(comment: "this is fourth comment", user: user)
   