require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  let!(:restaurant) { FactoryGirl.create(:restaurant) }
  let!(:user) { FactoryGirl.create(:user) }
  let(:mail) { UserMailer.review_alert_email(user) }

  it "renders the subject" do
    expect(mail.subject).to eql("Information regarding your business")
  end

  it "renders the receiver email" do
    expect(mail.to).to eql([user.email])
  end

  it "renders the sender email" do
    expect(mail.from).to eql(["notifications@example.com"])
  end
end
