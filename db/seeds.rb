# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb
Book.destroy_all

case Rails.env
when "development"
  5.times do |i|
    Book.create!(
      title: "Dev Book #{i + 1}",
      author: "Dev Author #{i + 1}",
      price: 10.00 + i,
      published_date: "2026-01-0#{i + 1}"
    )
  end
  puts "Seeded #{Book.count} books in DEVELOPMENT."

when "production"
  5.times do |i|
    Book.create!(
      title: "PROD Book #{i + 1}",
      author: "Prod Author #{i + 1}",
      price: 25.00 + i,
      published_date: "2026-05-1#{i + 1}"
    )
  end
  puts "Seeded #{Book.count} books in PRODUCTION."

when "test"
  5.times do |i|
    Book.create!(
      title: "Test Book #{i + 1}",
      author: "Test Author #{i + 1}",
      price: 5.00 + i,
      published_date: "2026-09-0#{i + 1}"
    )
  end
  puts "Seeded #{Book.count} books in TEST."
end