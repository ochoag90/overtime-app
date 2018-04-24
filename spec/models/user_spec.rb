require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      # @user = User.create(email:"test@test.com",password: "abcdef", password_confirmation: "abcdef", first_name: "John", last_name: "Snow")
      @user = FactoryBot.create(:user)
    end 

  describe 'creation' do 

  	it 'can be created' do
  		expect(@user).to be_valid
  	end 

  end 

  describe 'Validation' do 

    it "can not be created without a first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end 

    it "can not be created without a last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "can not be created without a phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it 'requires the phone attribute to only contain integers' do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'requires the phone attribute to only have 10 characters' do
      @user.phone = '12345678901'
      expect(@user).to_not be_valid
    end 

  end

  describe "custom name methods" do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq('SNOW, JOHN')
    end
  end 

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee_1 = FactoryBot.create(:user)
      employee_2 = FactoryBot.create(:user)
      admin = FactoryBot.create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin.id, hand_id: employee_2.id)
      expect(admin.hands.count).to eq(2)
    end 
  end
end 
 