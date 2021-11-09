# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {
    name: 'Juan',
    photo: 'sasbasja.jpg',
    bio: 'Soy juan',
    posts_counter: 0,
  },
  {
    name: 'Carlos',
    photo: 'sasbasja.jpg',
    bio: 'Soy Carlos',
    posts_counter: 0,
  },
  {
    name: 'Tyler',
    photo: 'sasbasja.jpg',
    bio: 'Soy Tyler',
    posts_counter: 0,
  },
]

User.create(users.map { |user| user })
