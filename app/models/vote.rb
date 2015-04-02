class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true

  def increment
    notice = ""
    if self.score <= 0
      self.update(score: 1)
      notice = "Vote added!"
    else
      notice = "You can't upvote more than once!"
    end
    notice
  end

  def decrement
    notice = ""
    if self.score >= 0
      self.update(score: -1)
      notice = "Vote added!"
    else
      notice = "You can't downvote more than once!"
    end
    notice
  end

end
