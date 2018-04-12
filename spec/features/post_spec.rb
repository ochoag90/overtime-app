require 'rails_helper'

describe 'navigate' do

  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
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
      @post = FactoryBot.create(:post)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
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
  		click_on "save"

  		expect(page).to have_content("Some Rationale")
  	end

  	it "will have a user associated with it" do
  		fill_in 'post[date]', with: Date.today
  		fill_in 'post[rationale]', with: 'User Association'
  		click_on "save"
  		expect(User.last.posts.last.rationale).to eq("User Association")
  	end
  end
  describe 'edit' do
    before do
      @edit_user = User.create(first_name: "Ana", last_name: "Ochoa", email: 'test1@test.com', password: "abcdef", password_confirmation: "abcdef")
      login_as(@edit_user, :scope => :user)
      @edit_post = Post.create(date: Date.today, rationale: "Comment Here", user_id: @edit_user.id)
    end 

    #Tests below this commented test are already checking page status

    # it 'can be reached by clicking edit on index page' do
    #   visit posts_path

    #   click_link("edit_#{@post.id}")
    #   expect(page.status_code).to eq(200)
    # end 

    it 'can be edited' do
      visit edit_post_path(@edit_post)
      
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited Content'
      click_on "save"

      expect(page).to have_content("Edited Content")
    end 

    it 'cannot be edited by a non authorized user' do
      logout(:user)

      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(root_path)
    end 
  end 
end