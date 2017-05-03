require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:mark)
    @course = @user.courses.build(name: "New Course", prerequisite: "Web Programming", description: "This is a new course. Description needs to be at least 30 characters.")
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "user id should be present" do
    @course.user_id = nil
    assert_not @course.valid?
  end
  
  test "name should be present" do
    @course.name = "   "
    assert_not @course.valid?
  end

  test "name should be at most 100 characters" do
    @course.name = "a" * 51
    assert_not @course.valid?
  end
  
  test "name should be at least 10 characters" do
    @course.name = "a" * 9
    assert_not @course.valid?
  end
  
  test "prerequisite should be present" do
    @course.prerequisite = "   "
    assert_not @course.valid?
  end

  test "prerequisite should be at most 100 characters" do
    @course.prerequisite = "a" * 51
    assert_not @course.valid?
  end
  
  test "prerequisite should be at least 10 characters" do
    @course.prerequisite = "a" * 9
    assert_not @course.valid?
  end
  
  test "description should be present" do
    @course.description = "   "
    assert_not @course.valid?
  end

  test "description should be at most 400 characters" do
    @course.description = "a" * 401
    assert_not @course.valid?
  end
  
  test "description should be at least 30 characters" do
    @course.description = "a" * 29
    assert_not @course.valid?
  end

end
