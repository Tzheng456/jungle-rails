require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should successfully create a user with all appropriate fields filled in' do
      @user = User.create(name: "name", email:"1@test.com", password:"123456", password_confirmation: "123456")
      expect(@user).to be_valid
    end

    it 'should not have a nil value for name' do
      @user = User.create(name: nil, email:"1@test.com", password:"123456", password_confirmation: "123456")
      expect(@user.errors.full_messages).to include ("Name can't be blank")
    end
  end
end
