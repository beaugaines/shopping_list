# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user = User.create(
#   email: 'test@user.com',
#   password: 'password'
# )

items = %w(avocado onion garlic lime cilantro jalapeno tomato)

items.each do |name|
  Item.create(
    name: name,
    price: rand(1000...3000),
    description: FFaker::CheesyLingo.sentence
  )
end
