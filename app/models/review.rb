class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  RATINGS = [1,2,3,4,5]
end
