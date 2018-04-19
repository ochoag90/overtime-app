FactoryBot.define do
	sequence :email do |n|
		"test#{n}@example.com"
	end 

	factory :user do
		first_name "John"
		last_name "Snow"
		email {generate :email}
		password "abcdef"
		password_confirmation "abcdef"
		phone "5555555551"
	end 

	# factory :user2  do
	# 	first_name "John"
	# 	last_name "Snow"
	# 	email {generate :email}
	# 	password "abcdef"
	# 	password_confirmation "abcdef"
	# end

	# factory :second_user, class: "User" do
	# 	first_name "Bob"
	# 	last_name "Dole"
	# 	email "test1@test.com"
	# 	password "abcdef"
	# 	password_confirmation "abcdef"
	# 	id 3
	# end

	factory :admin_user, class: "AdminUser" do
		first_name "Admin"
		last_name "User"
		email {generate :email}
		password "abcdef"
		password_confirmation "abcdef"
		phone "5555555551"
	end

	factory :non_authorized_user, class: "User" do
		first_name "non"
		last_name "authorized"
		email {generate :email}
		password "abcdef"
		password_confirmation "abcdef"
		phone "5555555551"
	end
end 