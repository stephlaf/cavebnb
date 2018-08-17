class CavesController < ApplicationController
  before_action :set_cave, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: :index

  def index
    # raise
    if params[:query].present?
      @caves = Cave.global_search(params[:query])
    else
      @caves =  Cave.all
    end

    if params[:rating].present?
      # puts params[:rating]
      @caves = @caves.where(rating: params[:rating])
    end
    # raise
  end

  # def top
  #   @caves = Cave.where(rating: 5)
  #   render :index
  # end

  def show
    # it is not an array of one hash
    @markers = [{lat: @cave.latitude, lng: @cave.longitude}]
    @review = Review.new
  end

  def new
    @cave = Cave.new
  end

  def create
    @cave = current_user.owned_caves.new(cave_params)

    if @cave.save
      # temporary code to automatically add some new amenities to the newly created cave
      Amenity.all.shuffle.take(rand(7)+1).each do |amenity|
        CaveAmenity.create(cave: @cave, amenity: amenity)
       end
      redirect_to cave_path(@cave)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cave.update(cave_params)
      redirect_to cave_path(@cave)
    else
      render :edit
    end
  end

  def destroy
    @cave.destroy
    redirect_to caves_path
  end

  private

  def set_cave
    @cave = Cave.find(params[:id])
  end

  def cave_params
    params.require(:cave).permit(:name, :photo, :address, :amenities, :rating, :price, :availability, :user)
  end
end
