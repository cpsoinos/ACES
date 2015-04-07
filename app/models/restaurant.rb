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
    if self.reviews.count > 0
      self.reviews.sum(:rating)/self.reviews.count
    end
  end

  def self.top_restaurants
    top_hash = {}
    top_array = []
    restaurants = Restaurant.all
    restaurants.each do |restaurant|
      if restaurant.reviews.count > 0
        top_hash[restaurant] = restaurant.average_rating
      end
    end
    top_array << top_hash.sort_by { |k, v| -v }.first(5)
    top_array.flatten(1)
  end

  def editable_by?(current_user)
    current_user.role == "admin" || current_user == user
  end

  def self.search_results(query)
    sql = %Q{
      restaurants.name ILIKE ?
      or restaurants.description ILIKE ?
      or reviews.body ILIKE ?
    }
    Restaurant.joins(:reviews).where(
    [sql, "%#{query}%", "%#{query}%", "%#{query}%"]
    ).distinct
  end
end
