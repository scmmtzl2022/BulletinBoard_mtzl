# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: 'admin',email: 'admin@gmail.com',password: '$2a$12$axNbV5l2zjIFA0TBYpXneu1n1z2X4bF2SIliDTMacY58gkfNKfEAm' ,role: 'admin')
