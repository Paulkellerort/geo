require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid users not saved" do
  get signup_path
  assert_template 'users/new'
  assert_no_difference 'User.count' do |x|
  	post users_path user: {name: "", email: "paul@", 
  		password: "h", password_confirmation: "hh"}
  	end
  assert_template 'users/new'
  assert_select  'div#error_explanation'
  assert_select  'div.field_with_errors'

 end



 test "valid user submission and save to database" do
 	get signup_path
 	assert_difference 'User.count', 1 do |x|
 		post_via_redirect users_path user: {name: "foobar", email: "foo@bar.com", 
  		password: "hhhhhh", password_confirmation: "hhhhhh"}
  	end
 	assert_template 'users/show'
  assert is_logged_in?
 end

 test "flash message displayed on signup success" do
 	get signup_path
 	post_via_redirect users_path user: {name: "foobar", email: "foo@bar.com", 
  		password: "hhhhhh", password_confirmation: "hhhhhh"}
  	assert_not flash.nil?
  end


end
