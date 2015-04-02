class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  has_many :votes

  validates :body, presence: true
  validates :rating, presence: true
  RATINGS = [1, 2, 3, 4, 5]
end
