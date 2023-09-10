# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def generate_links
  links = []
  rand(1..5).times do
    links << Faker::Internet.url
  end
  links
end

def random_role
  roles = %w[frontend backend fullstack mobile designer qa]
  roles.sample
end

puts 'Inserting profiles...'
10.times do
  profile = Profile.find_or_create_by(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::Number.number(digits: 11)
  )

  profile.update(links: generate_links)
  profile.update(role: random_role)
end
puts 'Finished inserting profiles!'
