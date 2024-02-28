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
puts "Destroy all birds"

20.times do
  faker_bird = Faker::Creature::Bird
  first_name = Faker::Name.first_name
  url_id = Random.rand(10..40)

  user_email = Faker::Internet.email(domain: 'gmail.com')
  user_password = Faker::Internet.password(min_length: 8)

  user = User.new(
    email: user_email,
    encrypted_password: user_password
  )
  user.save!
  puts "#{user.email} - #{user.encrypted_password} created !"

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

# t.string :chant_url
# t.string :name
# t.string :common_family
# t.string :geography
