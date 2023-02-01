require "test_helper"

class UserSignInTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: "logintest", email: "logintest@email.com", password: "password")
  end

  test "sign in and show user page" do
    get "/login"
    assert_response :success
    sign_in_as(@user)
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "logintest's profile"
  end

end
