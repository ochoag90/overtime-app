require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do

  	before do
      # user = User.create(email: "testpost@test.com", password: "abcdefg", password_confirmation: "abcdefg", first_name: "test", last_name: "test")
  		# @post = Post.create!(date: Date.today, rationale: "Anything", user_id: user.id)
      @post = FactoryBot.create(:post)
  	end 

  	it 'can be created' do
  		expect(@post).to be_valid
  	end

  	it "cannot be created without a date and rationale" do
  		@post.date = nil
  		@post.rationale = nil
  		expect(@post).to_not be_valid
  	end 
  end 
end 

