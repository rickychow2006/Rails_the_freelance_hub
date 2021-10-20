# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.create(name: "Graphic & Design")
Service.create(name: "Digitial Marketing")
Service.create(name: "Writing & Translation")
Service.create(name: "Video & Animation")
Service.create(name: "Music & Audio")
Service.create(name: "Programming & Tech")
Service.create(name: "Data")
Service.create(name: "Business")
Service.create(name: "Lifestyle ")

User.create(username: "Emily Xiao", email:"Emily123@gmail.com", password: "123456")
User.create(username: "Marek Ski", email:"Marek1@gmail.com", password: "123456")