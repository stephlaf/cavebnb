class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy, :reject, :accept ]
  before_action :set_cave, except: [ :index, :destroy, :show, :reject, :accept ]

  def index
    @bookings =  Booking.all
    @sent_bookings = Booking.where(user_id: current_user.id)
    @received_bookings = Booking.joins(:cave).where(caves: { user_id: current_user.id })

    @incoming_bookings = @received_bookings.where(status: "accepted")
    @proposed_incoming_bookings = @received_bookings.where(status: "proposed")
    @rejected_incoming_bookings = @received_bookings.where(status: "rejected")
    @cancelling_incoming_bookings = @received_bookings.where(status: "cancelrequested")
    @ancient_incoming_bookings = @received_bookings.where(status: "ancient")

    @upcoming_bookings = @sent_bookings.where(status: "accepted")
    @proposed_bookings = @sent_bookings.where(status: "proposed")
    @rejected_bookings = @sent_bookings.where(status: "rejected")
    @cancelling_bookings = @sent_bookings.where(status: "cancelrequested")
    @ancient_bookings = @sent_bookings.where(status: "ancient")
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
      if @booking.proposed?
        @booking.destroy
      else
        @booking.status = "cancelrequested"
        @booking.save
      end
    else
      @booking.destroy
    end
    redirect_to bookings_path
  end

  def accept
    @booking.accept!
    redirect_to bookings_path
  end

  def reject
    @booking.reject!
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
