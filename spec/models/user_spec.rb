require 'rails_helper'

RSpec.describe User, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryGirl.build :user
  end

  subject { @user }

  it { should respond_to :userid }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :encrypt_password}

  describe "when userid is missing" do
    before do
      @user.userid = ''
    end
    it {should_not be_valid}
  end

  describe "when password is missing" do
    before do
      @user.password = ''
    end
    it {should_not be_valid}
  end

  describe "when password_confirmation is missing" do
    before do
      @user.password_confirmation = ''
    end
    it {should_not be_valid}
  end

  describe "when password mismatch" do
    before do
      @user.password = 'password'
      @user.password_confirmation = 'password1'
    end
    it {should_not be_valid}
  end

  describe "when password is small" do
    before do
      @user.password = 'pass'
      @user.password_confirmation = 'pass'
    end
    it {should_not be_valid}
  end

  describe "when userid is not email address" do
    before do
      @user.userid = 'user'
    end
    it {should_not be_valid}
  end

  describe "when userid has wrong format" do
    before do
      @user.userid = '*.user/@domain.com'
    end
    it {should_not be_valid}
  end

  describe "when authenticated with correct password" do
    before do
      @user.save
    end
    let(:user) {User.find_by(userid: @user.userid)}
    it { should eq User.authenticate(@user.userid, @user.password) }
  end

  describe "when authenticated with incorrect password" do
    before do
      @user.save
    end
    let(:user) {User.find_by(userid: @user.userid)}
    it { should_not eq User.authenticate(@user.userid, "incorrect") }
  end

end
