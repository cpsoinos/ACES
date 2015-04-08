require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  let!(:user) { FactoryGirl.create(:user) }

  before do
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(user, :avatar)

    File.open("./spec/fixtures/images/dan.jpg") do |f|
      @uploader.store!(f)
    end
  end

  after do
    AvatarUploader.enable_processing = false
    @uploader.remove!
  end

  context "the small_thumb version" do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @uploader.small_thumb.should have_dimensions(20, 20)
    end
  end

  context "the thumb version" do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @uploader.thumb.should be_no_larger_than(200, 200)
    end
  end
end
