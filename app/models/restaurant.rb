class Restaurant < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  belongs_to :category
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def average_rating
    if reviews.count > 0
      reviews.sum(:rating) / reviews.count
    else
      1
    end
  end

  def self.top_restaurants
    top_hash = {}
    top_array = []
    restaurants = Restaurant.all
    restaurants.each do |restaurant|
      top_hash[restaurant] = restaurant.average_rating
    end
    top_array << top_hash.sort_by { |k, v| -v }.first(3)
    top_array.flatten(1)
  end

  def parse_for_google_maps
    @google_map_params = [street_address, city, state].join(" ")
    @google_map_params.gsub!(" ", "+")
  end

  def editable_by?(current_user)
    current_user.role == "admin" || current_user == user
  end

  def self.search(query)
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
