require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'should successfully create a user with all appropriate fields filled in' do
      @user = User.create(name: "name", email:"1@test.com", password:"123456", password_confirmation: "123456")
      expect(@user).to be_valid
    end

    it 'should not have a nil value for name' do
      @user = User.create(name: nil, email: "1@test.com", password: "123456", password_confirmation: "123456")
      expect(@user.errors.full_messages).to include ("Name can't be blank")
    end

    it 'should not have a nil value for email' do
      @user = User.create(name: "name", email: nil, password: "123456", password_confirmation: "123456")
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'should not allow account creation with duplicate emails' do
      @user = User.create(name: "name", email: "1@test.com", password: "123456", password_confirmation: "123456")
      @newUser = User.create(name: "name2", email: "1@test.com", password: "123456", password_confirmation: "123456")
      expect(@newUser.errors.full_messages).to include ("Email has already been taken")
    end

    it 'should not allow account creation with duplicate emails, case-insensitive' do
      @user = User.create(name: "name", email: "1@test.com", password: "123456", password_confirmation: "123456")
      @newUser = User.create(name: "name2", email: "1@tEsT.com", password: "123456", password_confirmation: "123456")
      expect(@newUser.errors.full_messages).to include ("Email has already been taken")
    end

    it 'should not have a nil value for password' do
      @user = User.create(name: "name", email: "1@test.com", password: nil, password_confirmation: "123456")
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it 'should not have a nil value for password confirmation' do
      @user = User.create(name: "name", email: "1@test.com", password: "123456", password_confirmation: nil)
      expect(@user.errors.full_messages).to include ("Password confirmation can't be blank")
    end

    it 'should have matching password confirmation' do
      @user = User.create(name: "name", email: "1@test.com", password: "123456", password_confirmation: "11123456")
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it 'should not have a password with a length of at least 6 characters' do
      @user = User.create(name: "name", email: "1@test.com", password: "12345", password_confirmation: "12345")
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end

  end
end
