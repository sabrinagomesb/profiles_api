# frozen_string_literal: true
require_relative 'seeds_constants'

roles = Profile.role_options.values

def generate_links
  links = []
  rand(1..5).times do
    links << Faker::Internet.url
  end
  links
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

BACKEND_ABILITIES.each do |skill|
  Ability.find_or_create_by(name: skill[:name], role: Profile.roles[:backend], description: skill[:description])
end

MOBILE_ABILITIES.each do |skill|
  Ability.find_or_create_by(name: skill[:name], role: Profile.roles[:mobile], description: skill[:description])
end

QA_ABILITIES.each do |skill|
  Ability.find_or_create_by(name: skill[:name], role: Profile.roles[:qa], description: skill[:description])
end

DESIGNER_ABILITIES.each do |skill|
  Ability.find_or_create_by(name: skill[:name], role: Profile.roles[:designer], description: skill[:description])
end

puts 'Finished inserting abilities!'

puts 'Inserting softskills...'

SOFTSKILLS.each do |skill|
  Softskill.find_or_create_by(name: skill)
end

puts 'Finished inserting softskills!'

# Create States and Cities from JSON file
puts 'Inserting states and cities...'

filepath = ENV.fetch('FILEPATH', Rails.root.join('db', 'states_cities.json').to_s)
states = JSON.parse(File.read(filepath))

states.each do |state|
  state_obj = State.find_or_create_by(acronym: state['acronym'], name: state['name'])

  state['cities'].each do |city|
    City.find_or_create_by(name: city['name'], state: state_obj)
    puts "Adicionando a cidade #{city['name']} ao estado #{state_obj.name}"
  end
end

puts 'Inserting profiles...'

cities = City.where(state_id: 6)
5.times do
  Profile.find_or_create_by(
    name: Faker::Name.name_with_middle,
    bio: Faker::Lorem.paragraph_by_chars(number: 50),
    email: Faker::Internet.email,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::Number.number(digits: 11),
    links: generate_links,
    role: roles.sample,
    city: cities.sample
  )
end

puts 'Seed finished!'
