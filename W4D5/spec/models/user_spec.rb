require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "banana@banana.com", password: "123456") }

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do
    kiwi = User.new(email: 'kiwi@fruits.com', password: '123456')
    it "should confirm a correct password" do
      expect(kiwi.is_password?('123456')).to be true 
    end

    it "should reject an incorrect password" do
      expect(kiwi.is_password?('130057')).to be false 
    end
  end

  describe "#reset_session_token!" do
    it "should reset the user's session token" do
      old_session_token = user.session_token
      user.reset_session_token!
      new_session_token = user.session_token
      expect(old_session_token != new_session_token).to be true
    end
  end

  describe "::find_by_credentials" do
    User.create(email: 'cherry@fruits.com', password: '123456') unless User.exists?(:email => 'cherry@fruits.com')
    cherry = User.last

    it "should find an existing user with correct credentials" do
      expect(User.find_by_credentials('cherry@fruits.com', '123456')).to eq(cherry)
    end

    it "should return nil for an existing user with incorrect credentials" do
      expect(User.find_by_credentials('cherry@fruits.com', '0900445')).to be_nil
    end

    it "should return nil for a nonexistent user" do
      expect(User.find_by_credentials('orange@fruits.com', '123456')).to be_nil
    end

  end


end
