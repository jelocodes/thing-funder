# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
  User.create(
    username: Faker::Name.first_name,
    bio: 'This is my bio',
    twitter: '@' + Faker::Internet.user_name,
    facebook: 'fb/' + Faker::Internet.user_name,
    website: Faker::Internet.url,
    password: Faker::Internet.password,
    email: Faker::Internet.email
  )
end

100.times do 
  Category.create(name: Faker::Commerce.department)
end

10.times do
  Project.create(
    user_id: Faker::Number.between(1, 20),
    name: Faker::Commerce.product_name,
    about: 'This product is great. You should fund it.',
    risk_and_challenges: 'Nothing at all.',
    deadline: Faker::Date.forward(360),
    faq:     <<-HEREDOC
                Q: Are FAQs useful? 
                A: Yes. Yes they are.
                Q: Do I enjoy writing sample copy?
                A: No. No I do not.
              HEREDOC
  )
  ProjectCategory.create(
    project_id: rand(1..20),
    category_id: rand(1..100)
  )
end


