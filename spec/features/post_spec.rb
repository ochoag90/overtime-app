require 'rails_helper'

describe 'navigate' do
  let(:user) {FactoryBot.create(:user)}

  let(:post) do 
    Post.create(date: Date.today, rationale: "rationale", user_id: user.id, overtime_request: 3.5)
  end 

  before do
    login_as(user, :scope => :user)
  end 

	describe 'index' do
    before do
      visit posts_path
    end

		it 'can be reached successfully' do
			# visit posts_path
			expect(page.status_code).to eq(200)
    	end

    	it 'has a title of Posts' do
			# visit posts_path
			expect(page).to have_content(/Posts/)
    	end

      it 'has a list of Posts' do
        # user = FactoryBot.create(:user)
        post1 = FactoryBot.build_stubbed(:post)
        post2 = FactoryBot.build_stubbed(:second_post)
        visit posts_path
        expect(page).to have_content(/Rationale|Content/)
      end 

      it 'has a scope so that only post creators can see their posts' do

        other_user = User.create(first_name: "non", last_name: "authorized", email: "nonauth@example.com", password: "abcdef", password_confirmation: "abcdef", phone: "5555555555")
    
        post_from_other_user = Post.create(date: Date.today, rationale: "This post shouldn't be seen", user_id: other_user.id, overtime_request: 3.5)

        visit posts_path

        expect(page).to_not have_content(/This post shouldn't be seen/)
      end 
  end

  describe 'new' do
    it 'has a link from the homepage' do
        visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end 

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      delete_user = FactoryBot.create(:user)
      login_as(delete_user, :scope => :admin_user)

      post_to_delete = Post.create(date: Date.today, rationale: "rationale", user_id: delete_user.id, overtime_request: 3.5)

      visit posts_path

      click_link("delete_post_#{post_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end 
  end 


  describe 'creation' do

  	before do
  		visit new_post_path
  	end 

  	it 'has a new form that can be reached' do	
  		expect(page.status_code).to eq(200)
  	end 

  	it 'can be created from new form page' do
  		fill_in 'post[date]', with: Date.today
  		fill_in 'post[rationale]', with: 'Some Rationale'
      fill_in 'post[overtime_request]', with: 4.5
  		
  		expect {click_on "save"}.to change(Post, :count).by(1)
  	end

  	it "will have a user associated with it" do
  		fill_in 'post[date]', with: Date.today
  		fill_in 'post[rationale]', with: 'User Association'
      fill_in 'post[overtime_request]', with: 4.5
  		click_on "save"
  		expect(User.last.posts.last.rationale).to eq("User Association")
  	end
  end
  describe 'edit' do

    #Tests below this commented test are already checking page status

    # it 'can be reached by clicking edit on index page' do
    #   visit posts_path

    #   click_link("edit_#{@post.id}")
    #   expect(page.status_code).to eq(200)
    # end 

    it 'can be edited' do
      visit edit_post_path(post)
      
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'
      click_on "save"

      expect(page).to have_content("Edited Content")
    end 

    it 'cannot be edited by a non authorized user' do
      logout(:user)

      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end 
  end 
end