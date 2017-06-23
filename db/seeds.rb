# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.email = 'james@test.com'
user.password = 'testing'
user.password_confirmation = 'testing'
user.superadmin_role = true
user.save!

Item.create! id: 1, name: "Banana", price: 25, description: 'This is mock data', avatar_file_name: 'startup-593329_1920.jpg'
Item.create! id: 2, name: "Apple", price: 40, description: 'This is mock data', avatar_file_name: 'startup-593329_1920.jpg'
Item.create! id: 3, name: "Carton of Strawberries", price: 10.99, description: 'This is mock data', avatar_file_name: 'startup-593329_1920.jpg'

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled" 
