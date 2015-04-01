class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  validates :body, presence: true
  validates :rating, presence: true
  RATINGS = [1, 2, 3, 4, 5]
end
