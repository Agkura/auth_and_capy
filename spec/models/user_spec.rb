require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: "bob", password: "password") }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:goal_comments) }
    it { should have_many(:user_comments) }
  end

  describe 'Methods' do
    before { user.save! }

    describe '::find_by_credentials' do
      it 'returns nil if bad credentials' do
        bad_search = User.find_by_credentials(username: "bob", password: "blah")
        expect(bad_search).to be_nil
      end
      it 'returns a User object with valid credentials' do
        good = User.find_by_credentials(username: "bob", password: "password")
        expect(good).to eq(:user)
      end
    end

    describe '#is_password?' do
      it 'should return false for an invalid password' do
        expect(user.is_password?("Hi")).to be_false
      end
      it 'should return true for a valid password' do
        expect(user.is_password?("password")).to be_true
      end
    end

    describe '#password=' do
      it 'sets password_digest' do
        no_pass = User.new
        expect(no_pass.password_digest).to be_nil
        no_pass.password = "password"
        expect(no_pass.password_digest).to_not be_nil
      end
      it 'sets an instance variable, @password' do
        no_pass = User.new
        expect(no_pass.password).to be_nil
        no_pass.password = "password"
        expect(no_pass.password).to_not be_nil
      end
    end

    describe '::reset_session_token' do
      it 'gives a new session token' do
        old_token = user.session_token
        user.reset_session_token!
        expect(old_token).to_not eq(user.session_token)
      end
    end
  end
end
