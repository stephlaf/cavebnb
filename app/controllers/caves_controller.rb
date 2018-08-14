class CavesController < ApplicationController
  before_action :set_cave, only: [ :show, :edit, :update, :destroy ]
   skip_before_action :authenticate_user!, only: :index

  def index
    @caves =  Cave.all
  end

  # def top
  #   @caves = Cave.where(rating: 5)
  #   render :index
  # end

  def show
  end

  def new
    @cave = Cave.new
  end

  def create
    @cave = Cave.new(cave_params)

    if @cave.save
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
