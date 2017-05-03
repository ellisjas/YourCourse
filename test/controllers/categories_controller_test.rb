require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get category_show_url
    assert_response :success
  end

  test "should get new" do
    get category_new_url
    assert_response :success
  end

  test "should get create" do
    get category_create_url
    assert_response :success
  end

end
