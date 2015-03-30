class Restaurant < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
