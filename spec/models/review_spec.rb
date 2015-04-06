require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "#user" do
    it "is not editable by user if the creator is not user" do
      review = FactoryGirl.create(:review)
      user = FactoryGirl.create(:user, role: "member")
      expect(review.editable_by?(user)).to eq(false)
    end

    it "is editable by user if the creator is user" do
      review = FactoryGirl.create(:review)
      expect(review.editable_by?(review.user)).to eq(true)
    end
  end
end
