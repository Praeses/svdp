# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
%w( lex.childs@praeses.com zac.kleinpeter@praeses.com ).each do |email|
  u          = User.new
  u.username = email.split('.').first
  u.email    = email
  u.password = 'letmein1234'
  u.save!
end

Tag.create({name: "Gas"})
Tag.create({name: "Electric"})
Tag.create({name: "Rent"})
Tag.create({name: "Water"})
Tag.create({name: "Food"})
Tag.create({name: "Furniture"})
Tag.create({name: "Voucher"})
Tag.create({name: "Christmas"})
Tag.create({name: "Pharmacy"})
Tag.create({name: "Medical"})
Tag.create({name: "Legal"})

Tag.create({name: "Other"})




