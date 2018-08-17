class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @review = current_user.reviews.create(review_params)
    redirect_to @review.cave
  end

  def edit
  end

  def update
  end

  def destroy
    @review = Review.find(params[:id])
    cave = @review.cave
    @review.destroy

    redirect_to cave
  end

  private
    def review_params
      params.require(:review).permit(:comment, :star, :cave_id)
end
end
