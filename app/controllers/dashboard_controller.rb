class DashboardController < ApplicationController
  def index
    @socks = current_user.socks
    @booked_socks = current_user.socks.select { |sock| sock.bookings.exists? }
  end
end
