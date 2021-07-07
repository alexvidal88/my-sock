class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @sock = @booking.sock
    if @review.save
      redirect_to sock_bookings_path(@sock)
    else
      render :new
    end
  end

private

def review_params
  params.require(:review).permit(:stars, :content)
end
end
