# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
30.times do 
  User.create!(username: Faker::TvShows::SouthPark.unique.character, password: "password")
end
users = User.all


15.times do
  Sub.create!(moderator: users.sample.id, title: Faker::Color.unique.color_name, 
    description: Faker::TvShows::SouthPark.quote)
end

subs = Sub.all


40.times do
  posts = Post.all
  Post.create!(author: users.sample.id, title: Faker::Color.color_name, 
    url: Faker::Internet.url, content: Faker::ChuckNorris.fact, sub_id: subs.sample, 
    post_id: posts.sample.id)
end

