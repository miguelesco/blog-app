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


usersDb = User.create(users)

posts = [
  {
    author_id: usersDb[0].id,
    title: 'Post 1',
    text: 'Post text1',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[0].id,
    title: 'Post 2',
    text: 'Post text2',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[0].id,
    title: 'Post 3',
    text: 'Post text3',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[1].id,
    title: 'Post 4',
    text: 'Post text4',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[1].id,
    title: 'Post 5',
    text: 'Post text5',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[1].id,
    title: 'Post 6',
    text: 'Post text6',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[2].id,
    title: 'Post 7',
    text: 'Post text7',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[2].id,
    title: 'Post 8',
    text: 'Post text8',
    comments_counter: 0,
    likes_counter: 0,
  },
  {
    author_id: usersDb[2].id,
    title: 'Post 9',
    text: 'Post text9',
    comments_counter: 0,
    likes_counter: 0,
  },
]

# posts.each_with_index do |post, index|
#   Post.create!(post.merge(user_id: usersDb[index]))
# end

Post.create(posts.map { |post| post })
