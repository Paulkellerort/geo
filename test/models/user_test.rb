require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.create(name: "test", email: "test@tester.com", 
            password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
  	assert @user.valid?
  end

  test "check name present" do
  	@user.name = ""
  	assert_not @user.valid?
  end

  test "check email present" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "email length" do
  	@user.email = "a"*256
  	assert_not @user.valid?
  end

  test "name length" do 
  	@user.name = "a"*51
  	assert_not @user.valid?
  end

  test "email vaildation accepts valid emails" do
  	valid_emails = %w[hello@me.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_emails.each do |x|
    	@user.email = x
    	assert @user.valid?, "#{valid_emails.inspect} should be valid"
    end
  end

	test "email is valid format" do
		invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_emails.each do |x|
     @user.email = x
     assert_not @user.valid?, "#{invalid_emails.inspect} should be invalid"
  	end
  end

  test "emails are unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	duplicate_user.save
  	assert_not duplicate_user.valid?
  end

  test "password length" do
   @user.password = @user.password_confirmation = "a"*5
   assert_not @user.valid?
   end
 
end        