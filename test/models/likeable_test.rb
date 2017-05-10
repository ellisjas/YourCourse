require 'test_helper'

class LikeableTest < ActiveSupport::TestCase
  
  def setup
    @likeable = Likeable.new(liker_id: users(:mark).id,
                                     liked_id: courses(:java).id)
  end

  test "should be valid" do
    assert @likeable.valid?
  end

  test "should require a liker_id" do
    @likeable.liker_id = nil
    assert_not @likeable.valid?
  end

  test "should require a liked_id" do
    @likeable.liked_id = nil
    assert_not @likeable.valid?
  end
  
end
