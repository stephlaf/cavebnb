class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy ]
  before_action :set_cave, except: [ :index, :destroy, :show ]

  def index
    @bookings =  Booking.all
    @sent_bookings = Booking.where(user_id: current_user.id)
    @received_bookings = Booking.joins(:cave).where(caves: { user_id: current_user.id })
  end

  def show
    set_booking
    @cave = @booking.cave
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.cave = @cave
    @booking.user = current_user
    @booking.status = "proposed"

    if @booking.save
      redirect_to bookings_path
    else
    redirect_to cave_path(@cave)
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @cave = @booking.cave
    if @booking.user == current_user
      @booking.status = "cancelrequested"
      @booking.save
    else
      @booking.destroy
    end
    redirect_to bookings_path
  end

  private

  def set_cave
    @cave = Cave.find(params[:cave_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:cave_id, :user_id, :checkin, :checkout)
  end

end
