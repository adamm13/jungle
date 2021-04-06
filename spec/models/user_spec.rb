require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new ({
        password: "test123",
        password_confirmation: "test123",
        email: "bob@bob.com",
        first_name: "bobby",
        last_name: "bob"
      })
    end

    it 'checks to see if everything this valid' do
      expect(@user).to be_valid 
    end

    it "checks that a password length is at least 6 characters" do
      @user.password = "test"
      @user.password_confirmation = "test"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it "checks if the email is blank" do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "checks if the first name is blank" do
      @user.first_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "checks if the last name is blank" do
      @user.last_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "checks if no password is given" do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "checks that a password and password confirmation are the same" do
      @user.password = "test123"
      @user.password_confirmation = "test321"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "checks if the email is unique (not case sensitive)" do
      @user.email = "test@test.com"
      @user.save
      @user2 = User.new ({
        password: "test123",
        password_confirmation: "test123",
        email: "test@test.com",
        first_name: "bobby",
        last_name: "bob"
      })
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it "checks if the email is unique (case sensitive)" do
      @user.email = "test@test.com"
      @user.save
      @user2 = User.new ({
        password: "test123",
        password_confirmation: "test123",
        email: "TEST@test.com",
        first_name: "bobby",
        last_name: "bob"
      })
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end
  end
    describe '.authenticate_with_credentials' do
      before do
      @user = User.new ({
        password: "test123",
        password_confirmation: "test123",
        email: "bob@bob.com",
        first_name: "bobby",
        last_name: "bob"
      })
    end

    it "should authenticate_with_credentials when all fields are valid" do
      @user.save
      expect(User.authenticate_with_credentials("bob@bob.com", "test123")).to eql(@user)
    end

    it "should not authenticate when all the fields are invalid" do
      @user.save
      expect(User.authenticate_with_credentials("bobsdad@bob.com", "test1321")).to be_nil
    end

    it "should not authenticate when the email is invalid" do
      @user.save
      expect(User.authenticate_with_credentials("boasdadsb@bob.com", "test132")).to be_nil
    end

    it "should not authenticate when the password is invalid" do
      @user.save
      expect(User.authenticate_with_credentials("bob@bob.com", "test1343342")).to be_nil
    end

    it "should authenticate even if the email has blank spaces before and after" do
      @user.save
      expect(User.authenticate_with_credentials(" bob@bob.com ", "test123")).to eql(@user)
    end

    it "should authenticate even if case is not the same" do
      @user.save
      expect(User.authenticate_with_credentials("boB@bOb.coM", "test123")).to eql(@user)
    end
      
  end
end
