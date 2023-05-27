# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Promo.destroy_all
Product.destroy_all
ProductCategory.destroy_all
Organization.destroy_all
Category.destroy_all
User.destroy_all

User.create!({:email => "caegon2005@hotmail.com", :password => "omega200", :password_confirmation => "omega200" })
Category.create!({name:"tabacaria"})
Organization.create!({user_id:User.first.id,name:"tabacaria aguiar", fee:1, category_id: Category.first.id})
ProductCategory.create!({name:"cigarro"})
Product.create!({organization_id:Organization.first.id, product_category_id:ProductCategory.first.id,price:10.0, name:"cigarro"})
