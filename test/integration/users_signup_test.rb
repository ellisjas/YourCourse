require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "example.user@rmit.edu.au",
                                         password:              "Foobar1!",
                                         password_confirmation: "Foobar1!" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end