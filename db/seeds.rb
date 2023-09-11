# frozen_string_literal: true
require_relative 'seeds_constants'

roles = Profile.roles.values

def generate_links
  links = []
  rand(1..5).times do
    links << Faker::Internet.url
  end
  links
end

puts 'Inserting profiles...'
10.times do
  Profile.find_or_create_by(
    name: Faker::Name.name,
    bio: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::Number.number(digits: 11),
    links: generate_links,
    role: roles.sample
  )
end

puts 'Finished inserting profiles!'

puts 'Inserting techonologies...'

STACKS.each do |tech|
  Tech.find_or_create_by(name: tech)
end

puts 'Finished inserting techonologies!'

puts 'Inserting abilities...'

FRONTEND_ABILITIES.each do |skill|
  Ability.find_or_create_by(name: skill[:name], role: Profile.roles[:frontend], description: skill[:description])
end
