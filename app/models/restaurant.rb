class Restaurant < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  def editable_by?(current_user)
    current_user.role == "admin" || current_user == user
  end
end
