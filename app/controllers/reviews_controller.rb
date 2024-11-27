class ReviewsController < ApplicationController
  def new
    @review = Review.new
    # find the restaurant to be used in the form
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # WE need to instantiate the new review
    # using the information coming from the form
    @review = Review.new(review_params)
    # raise
    # the review belongs to a Restaurant
    # we need to FIND THE RESTAURANT
    @restaurant = Restaurant.find(params[:restaurant_id])
    # we need to assign the restaurant to the review
    @review.restaurant = @restaurant
    # raise
    # we need to save
    if @review.save
      # redirect to another page
      redirect_to restaurant_path(@restaurant)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant)
  end

  private
  # STRONG PARAMS!!!
  def review_params
    params.require(:review).permit(:content)
  end
end
