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
	Post.create!(date: Date.today, rationale: "#{post} Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?", user_id: @user.id, overtime_request: 2.5)
end 

puts "100 Posts have been created"

100.times do |audit_log|
	AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end 

puts "100 AuditLogs have been created"