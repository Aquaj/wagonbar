require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

batches = 20.times.map do |num|
  Batch.create(number: num, address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city}")
end

users = 20.times.map {
  User.create(batch_id: batches.sample.id, username: Faker::Internet.user_name)
}

comments = []
places = 50.times.map {
  place = Place.create(name: Faker::Company.name, author_id: users.sample.id)
  comments += 20.times.map {
    Comment.create(title: Faker::Book.title, content: Faker::Hipster.sentence, author_id: users.sample.id, place_id: place.id)
  }
  place
}

