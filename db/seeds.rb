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
Booking.destroy_all
User.destroy_all
Bird.destroy_all
puts "Destroy all birds"
20.times do
  faker_bird = Faker::Creature::Bird
  first_name = Faker::Name.first_name
  url_id = Random.rand(10..40)
  user_email = Faker::Internet.email(domain: 'gmail.com')
  user_password = Faker::Internet.password(min_length: 8)

  address = [
    '20 Rue Bellecordière, 69002 Lyon',
    '20 Pl. de la Croix-Rousse, 69004 Lyon',
    '28 Cr Franklin Roosevelt, 69006 Lyon',
    '13 Rue du Général Plessier, 69002 Lyon',
    '32 Rue Neuve, 69002 Lyon',
    '231 Rue Paul Bert, 69003 Lyon',
    '38 Cr Franklin Roosevelt, 69006 Lyon',
    '14 Rue Passet, 69007 Lyon',
    '56 Cr Gambetta, 69007 Lyon',
    '20 Quai Jules Courmont, 69002 Lyon',
    '20 Rue de Condé, 69002 Lyon',
    '20 Quai Jules Courmont, 69002 Lyon',
    '20 Rue Palais Grillet, 69002 Lyon',
    '20 Quai du Dr Gailleton, 69002 Lyon',
    '20 Quai de Bondy, 69005 Lyon',
    '20 Rue Saint-Jean, 69005 Lyon',
    '20 Rue Bellecordière, 69002 Lyon',
    '20 Rue Mulet, 69001 Lyon',
    '44 Rue Sergent Blandan, 69001 Lyon',
    '20 Rue de la Charité, 69002 Lyon',
    '20 Rue du Bœuf, 69005 Lyon'
  ]
  number = rand(0..20)
  user_address = address[number]
  address.slice!(number)
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
    geography: faker_bird.geo
  )
  bird.user = user
  bird.save!
  puts "#{bird.name} created !"
end
puts "Seed OK !"
