require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "#user" do
    it "is not editable by user if the owner is not user" do
      restaurant = FactoryGirl.create(:restaurant)
      user = FactoryGirl.create(:user, role: "member")
      expect(restaurant.editable_by?(user)).to eq(false)
    end

    it "is editable by user if the owner is user" do
      restaurant = FactoryGirl.create(:restaurant)
      expect(restaurant.editable_by?(restaurant.user)).to eq(true)
    end
  end
end
