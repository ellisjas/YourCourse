require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  def setup
    @location = locations(:one)
  end
  
  test "should be valid" do
    assert @location.valid?
  end
  
  test "location should be present" do
    @location.location = "      "
    assert_not @location.valid?
  end
  
  test "location cannot be too long" do
    @location.location = "a" * 21
    assert_not @location.valid?
  end
  
  test "location should be unique" do
    duplicate_location = @location.dup
    duplicate_location.location = @location.location.upcase
    @location.save
    assert_not duplicate_location.valid?
  end
  
end
