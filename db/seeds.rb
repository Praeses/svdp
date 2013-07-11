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
