require "test_helper"

class UserSignUpTest < ActionDispatch::IntegrationTest

  test "sign up and show user page" do
    get "/signup"
    assert_response :success
    post "/users", params: { user: { username: "user", email: "user@email.com", password: "password" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "user's profile"
    assert_equal "Welcome to the blog user, you have successfully signed up!", flash[:notice]
  end

end
