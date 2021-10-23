require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'returns error if password and password confirmation do not match' do
      @user = User.new(first_name: 'Google', last_name: 'Maps', email: 'GoogleMaps@mail.com', password: 'somepassword', password_confirmation: 'otherpass')
      @user.save
      expect(@user.errors.full_messages).to include("Passwords don't match")
    end


    it 'returns an error if first name is not provided' do
      @user = User.new(last_name: 'Maps', email: 'GoogleMaps@mail.com', password: 'somepassword', password_confirmation: 'somepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Must include a first name")
    end


    it 'returns an error if last name is not provided' do
      @user = User.new(first_name: 'Google', email: 'GoogleMaps@mail.com', password: 'somepassword', password_confirmation: 'somepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end


    it 'returns an error if email is not provided' do
      @user = User.new(first_name: 'Google', last_name: 'Maps', password: 'somepassword', password_confirmation: 'somepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Must include email")
    end


    it 'saves successfully when all fields are present and valid' do
      @user = User.new(first_name: 'Google', last_name: 'Maps', email: 'GoogleMaps@mail.com', password: 'somepassword', password_confirmation: 'somepassword')
      @user.save!
    end


    it 'returns an error if email already exixts in database' do
      @user1 = User.new(first_name: 'Google', last_name: 'Maps', email: 'GoogleMaps@mail.com', password: 'somepassword', password_confirmation: 'somepassword')
      @user1 = User.new(first_name: 'jonny', last_name: 'james', email: 'GoogleMaps@mail.com', password: 'goodpassword', password_confirmation: 'goodpassword')
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("This email is taken")
    end



    it 'returns an error if password is less than 8 characters' do
      @user = User.new(first_name: 'Google', last_name: 'Maps', email: 'GoogleMaps@mail.com', password: 'pool', password_confirmation: 'pool')
      @user.save
      expect(@user.errors.full_messages).to include("Password must be at least 8 characters")
    end


     it 'saves successfully if password is at least 8 characters' do
      @user = User.new(first_name: 'Google', last_name: 'Maps', email: 'GoogleMaps@mail.com', password: 'characters', password_confirmation: 'characters')
      @user.save!
    end
    
  end
end