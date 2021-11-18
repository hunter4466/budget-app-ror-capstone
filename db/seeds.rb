# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({ name: 'Mario', email: 'user1@mail.com', password: '111111', confirmed_at: '2021-01-01' })
user2 = User.create({ name: 'Alejandra', email: 'user2@mail.com', password: '111111', confirmed_at: '2021-01-01' })

