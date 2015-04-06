class Restaurant < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def average_rating
    self.reviews.sum(:rating)/self.reviews.count
  end

  def self.top_restaurants
    top_hash = {}
    top_array = []
    restaurants = Restaurant.all
    restaurants.each do |restaurant|
      top_hash[restaurant] = restaurant.reviews.sum(:rating)/restaurant.reviews.count
    end
    top_array << top_hash.sort_by { |k, v| -v }.first(5)
    top_array.flatten(1)
  end

end
