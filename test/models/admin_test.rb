require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
  def setup
    @admin = Admin.new(username: "admin", password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @admin.valid?
  end
  
  test "username should be present" do
    @admin.username = "     "
    assert_not @admin.valid?
  end
  
  test "username should not be too long" do
    @admin.username = "a" * 26
    assert_not @admin.valid?
  end
  
  test "username should be unique" do
    duplicate_admin = @admin.dup
    duplicate_admin.username = @admin.username.upcase
    @admin.save
    assert_not duplicate_admin.valid?
  end
  
  test "usernames should be saved as lower-case" do
    mixed_case_username = "aDmIn"
    @admin.username = mixed_case_username
    @admin.save
    assert_equal mixed_case_username.downcase, @admin.reload.username
  end
  
  test "password should be present (nonblank)" do
    @admin.password = @admin.password_confirmation = " " * 6
    assert_not @admin.valid?
  end

  test "password should have a minimum length" do
    @admin.password = @admin.password_confirmation = "a" * 5
    assert_not @admin.valid?
  end
  
end
