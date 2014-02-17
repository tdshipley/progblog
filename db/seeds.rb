# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
posts = []

posts << Post.new(title: "Working as a developer", body: "<p>Is really awesome - it is like adult lego.</p>")

posts << Post.new(title: "Ruby", body: "<p>Is a consise language which allows you to be
expressive. You can write your code in a simplistic way using concepts such as poetry mode;
which does away with keystrokes infavour of more readable english like syntax.</p>")

posts << Post.new(title: "Ruby On Rails", body: "<p>Ruby on rails is a web framework
which is simple and powerful.</p> <p>If you need a framework which will get out of your way
and let you focus on developing your web application then this is the web framework for you.
It encorages convention over configuration allowing you to forget about annoying configuration
details</p> <p>Using Rails you can increase your productivity by being consise in code thanks
to the power of ruby and also automation of key developer tasks such as testing - rails has
powerful frameworks baked in. But you can even use 3rd party ones easily with gems</p>")

posts.each do |post|
  post.save!
end

railspost_comments = posts[2].comments

railspost_comments
        .create(name: "Thomas", body: "The speed that you can create an app is really nice for proof of concept apps.")
        .save!
railspost_comments
        .create(name: "James", body: "I like it. I would like to know a little more about what is going on under the hood
        however. A lot of rails at the moment just feel a little too much like magic!")
        .save!