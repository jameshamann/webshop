# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.email = 'james@samplelogistics.com'
user.password = 'testing'
user.password_confirmation = 'testing'
user.superadmin_role = true
user.first_name = 'James'
user.last_name = 'Hamann'
user.save!
