# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
newAcc = Account.create({:name => 'cameron', :email => 'test@test.edu', :password => 'password', :password_confirmation => 'password'})
Books = Book.create({ isbn: '1584885114', title: 'Advanced University Physics, Second Edition', edition: "12th", condition: "new", price: 100, author: "Milazzo", seller_id: 104})
Wishlists = Wishlist.create({user_id: 12, book_id: 1})
