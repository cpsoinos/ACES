class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true

  def increment
    if score <= 0
      update(score: 1)
    end
  end

  def decrement
    if score >= 0
      update(score: -1)
    end
  end
end
