require 'test_helper'

class UsersControllerTest < ActionController::TestCase
 
include ApplicationHelper

 test "should get new" do
    get :new
    assert_response :success
  	assert_select "title", full_title("Sign up")
  end


end
