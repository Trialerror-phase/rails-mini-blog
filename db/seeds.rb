# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
puts "Clearing database..."
Comment.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all

# Create users
puts "Creating users..."
users = [
  { username: "admin", email: "admin@example.com", password: "password", password_confirmation: "password" },
  { username: "user1", email: "user1@example.com", password: "password", password_confirmation: "password" },
  { username: "user2", email: "user2@example.com", password: "password", password_confirmation: "password" }
]

users.each do |user_attrs|
  User.create!(user_attrs)
end
puts "Created #{User.count} users."

# Create categories
puts "Creating categories..."
categories = %w[Technology Lifestyle Health Education Entertainment]
categories.each do |name|
  Category.create!(name: name)
end
puts "Created #{Category.count} categories."

# Create posts
puts "Creating posts..."
posts = [
  { title: "The Future of AI", content: "Artificial intelligence is transforming the world...", category_id: Category.find_by(name: "Technology").id, user_id: User.first.id },
  { title: "Healthy Living Tips", content: "Stay healthy by eating a balanced diet...", category_id: Category.find_by(name: "Health").id, user_id: User.second.id },
  { title: "Top 10 Programming Languages", content: "Explore the most popular programming languages...", category_id: Category.find_by(name: "Education").id, user_id: User.third.id }
]

posts.each do |post_attrs|
  Post.create!(post_attrs)
end
puts "Created #{Post.count} posts."

# Create comments
puts "Creating comments..."
comments = [
  { content: "This is a very insightful article!", user_id: User.first.id, post_id: Post.first.id },
  { content: "Thanks for sharing these tips!", user_id: User.second.id, post_id: Post.second.id },
  { content: "Great content! Keep it up.", user_id: User.third.id, post_id: Post.third.id }
]

comments.each do |comment_attrs|
  Comment.create!(comment_attrs)
end
puts "Created #{Comment.count} comments."

puts "Database successfully seeded!"
