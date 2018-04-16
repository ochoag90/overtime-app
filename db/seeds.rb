# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@user = User.create(email:"test@test.com",
					password: "abcdef", 
					password_confirmation: "abcdef",
					first_name: "John", 
					last_name: "Snow",
					phone:"6179413379")

puts "1 user has been created"

AdminUser.create(	email:"admin@test.com",
					password: "abcdef",
					password_confirmation: "abcdef",
					first_name: "Gabe", 
					last_name: "Ochoa",
					phone:"6179413379")

puts "1 admin user has been created"

100.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end 

puts "100 Posts have been created"

100.times do |audit_log|
	AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 2.days))
end 

puts "100 AuditLogs have been created"