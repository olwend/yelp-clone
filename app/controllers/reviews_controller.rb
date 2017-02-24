class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id].to_i)

    @review = @restaurant.build_review review_params, current_user

    if @review.save
      redirect_to restaurants_path
    else
       @review.errors[:user]
        # Note: if you have correctly disabled the review button where appropriate,
        # this should never happen...
        # flash[:notice] = 'You have already reviewed this restaurant'
        # flash[:alert]= 'You have already reviewed this restaurant'
        # redirect_to restaurants_path, :alert => 'You have already reviewed this restaurant'
        redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
    end
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
