class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @socks = current_user.socks
    @my_bookings = current_user.bookings
    @for_booking = Booking.where(sock_id: @socks.pluck(:id))
  end
end
