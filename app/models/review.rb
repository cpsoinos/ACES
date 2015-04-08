class Review < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :restaurant
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :body, presence: true
  validates :rating, presence: true
  RATINGS = [1, 2, 3, 4, 5]

  def score
    votes.sum(:score)
  end

  def editable_by?(current_user)
    current_user.role == "admin" || current_user == user
  end
end
