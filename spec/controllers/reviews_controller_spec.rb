require 'spec_helper'

describe ReviewsController do
  describe "POST create" do
    context "with valid input" do
      before :each do
        @user = Fabricate(:user)
        session[:user_id] = @user.id
        @video = Fabricate(:video)
        post :create, review: { content: "Good film", rating: 4 }, video_id: @video.id
      end
      it "creates the review" do
        @video.reviews.count.should == 1
      end
      it "redirects to video path" do
        response.should redirect_to video_path(@video)
      end
    end

    context "with invalid inputs" do
      before :each do
        @user = Fabricate(:user)
        session[:user_id] = @user.id
        @video = Fabricate(:video)
        post :create, review: { rating: 4 }, video_id: @video.id
      end
      it "does not create a user" do
        @video.reviews.count.should == 0
      end
      it "renders the new template" do
        response.should render_template 'videos/show'
      end
    end
  end
end