require "rails_helper"

RSpec.describe Vote, type: :model do
  it "increments score" do
    vote = FactoryGirl.create(:vote)
    vote.increment
    expect(vote.score).to eq 1
  end
  it "decrements score" do
    vote = FactoryGirl.create(:vote)
    vote.decrement
    expect(vote.score).to eq (-1)
  end

end
