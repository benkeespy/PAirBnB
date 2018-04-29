# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = {}
user['password'] = 'benjamin'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::GameOfThrones.house
    user['email'] = Faker::Internet.email
    user['gender'] = ['Female','Male'][rand(2)]
    user['age'] = Faker::Date.birthday(18, 40)
   
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }
# User.all.each do |user|
# 	uids << user.id
# end

ActiveRecord::Base.transaction do
  40.times do 
    listing['name'] = Faker::App.name
    listing['description'] = Faker::Hipster.sentence
    listing['type_of_accommodation'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['price'] = rand(100..1000)

    listing['number_rooms'] = rand(0..5)
    listing['number_beds'] = rand(1..6)
    listing['guest_number'] = rand(1..10)

    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['zip_code'] = Faker::Address.zip_code
    listing['street_address'] = Faker::Address.street_address

    
    

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
