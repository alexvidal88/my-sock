class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy

  def index
    @sock = Sock.find(params[:sock_id])
    @bookings = Booking.all
  end

  def new
    @sock = Sock.find(params[:sock_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @sock = Sock.find(params[:sock_id])
    @booking.user = current_user
    @booking.sock = @sock
    if @booking.save
      redirect_to sock_path(@sock)
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to sock_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
