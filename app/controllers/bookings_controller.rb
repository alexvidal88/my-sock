class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy

  def create
    @booking = Booking.new(booking_params)
    @sock = Sock.find(params[:list_id])
    @booking.sock = @sock
    if @booking.save
      redirect_to sock_path(@sock)
    else
      render 'socks/:sock_id/bookings'
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :movie_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
