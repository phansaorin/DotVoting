# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["admin", "user"].each do |role|
	Role.find_or_create_by_name role
end

role = Role.find_by_name("admin")
User.find_or_create_by_email(:email => "admin@gmail.com", :password => "12345678", :password_confirmation => "12345678", :role_id => role.id)
