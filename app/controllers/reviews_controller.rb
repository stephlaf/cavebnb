class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @cave = Cave.find(params[:cave_id])
    @review = Review.new(review_params)
    @review.cave = @cave

    if @review.save
      redirect_to @review.cave
    else
      render :new
    end
  end


  private
    def review_params
      params.require(:review).permit(:comment, :stars, :cave_id)
end
end
