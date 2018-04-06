FactoryBot.define do
	factory :post do
		date Date.today
		rationale "Some Rationale"
		# user_id 3
		user
	end 

	factory :second_post, class: "Post" do
		date Date.yesterday
		rationale "Some Content"
		# user_id 3
		user
	end
end 