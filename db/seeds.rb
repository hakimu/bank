# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do
  user = User.create(username: Faker::Name.unique.name, email: Faker::Internet.email, password_digest: Faker::Internet.password)
  Account.create(number: Faker::Number.number(10), balance: 0, user_id: user.id, description: ['checking', 'savings', 'money_market', 'CD', 'IRA'].shuffle.first ) 
end
