class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true

  def increment
    notice = ""
    if score <= 0
      update(score: 1)
      notice = "Vote Recieved"
    else
      notice = "You cannot vote twice on a single review"
    end
    notice
  end

  def decrement
    notice = ""
    if score >= 0
      update(score: -1)
      notice = "Vote Recieved"
    else
      notice = "You cannot vote twice on a single review"
    end
    notice
  end
end
