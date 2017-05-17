module ApplicationHelper
  
  def count_likes(course)
    course.likeables.where(like: true).count
  end
  
  def count_dislikes(course)
    course.likeables.where(like: false).count
  end
  
end
