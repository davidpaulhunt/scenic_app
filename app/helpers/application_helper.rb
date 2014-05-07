module ApplicationHelper

  def time_since(comment)
    "- about " + distance_of_time_in_words(comment.created_at, Time.now) + " ago."
  end

end
