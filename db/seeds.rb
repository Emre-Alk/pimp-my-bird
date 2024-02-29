# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# https://xeno-canto.org/839842/embed?simple=1

require 'faker'
Bird.destroy_all
Booking.destroy_all
User.destroy_all

address = [
  '20 Bellecordière, 69002 Lyon',
  '20 Croix-Rousse, 69004 Lyon',
  '28 Franklin Roosevelt, 69006 Lyon',
  '13 Général Plessier, 69002 Lyon',
  '32 Neuve, 69002 Lyon',
  '231 Paul Bert, 69003 Lyon',
  '38 Franklin Roosevelt, 69006 Lyon',
  '14 Passet, 69007 Lyon',
  '56 Gambetta, 69007 Lyon',
  '20 Jules Courmont, 69002 Lyon',
  '20 Condé, 69002 Lyon',
  '20 Jules Courmont, 69002 Lyon',
  '20 Palais Grillet, 69002 Lyon',
  '20 Gailleton, 69002 Lyon',
  '20 Bondy, 69005 Lyon',
  '20 Saint-Jean, 69005 Lyon',
  '20 Bellecordière, 69002 Lyon',
  '20 Mulet, 69001 Lyon',
  '44 Sergent Blandan, 69001 Lyon',
  '20 Charité, 69002 Lyon',
  '20 Bœuf, 69005 Lyon'
]

puts "Destroy all birds"
20.times do
  faker_bird = Faker::Creature::Bird
  first_name = Faker::Name.first_name
  url_id = Random.rand(10..40)
  user_email = Faker::Internet.email(domain: 'gmail.com')
  user_password = Faker::Internet.password(min_length: 8)



  user_address = address[0]
  address.slice!(0)
  puts "#{user_address} is created!"
  user = User.new(
    email: user_email,
    password: user_password,
    address: user_address
  )
  user.save!
  puts "#{user.email} - #{user.password} - #{user.address} created !"
  bird = Bird.new(
    chant_url: "https://xeno-canto.org/8398#{url_id}/embed?simple=1",
    name: first_name,
    common_family: faker_bird.common_name,
    geography: faker_bird.geo,
    rating: rand(3.0..5.0).round(1),
    price: rand(10..40).to_i
  )
  bird.user = user
  bird.save!
  puts "#{bird.name} created !"
end
puts "Seed OK !"
