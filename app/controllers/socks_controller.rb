class SocksController < ApplicationController

  before_action :set_sock, only: [:show, :edit, :update, :destroy]

  def index
    @socks = Sock.all

    @markers = @socks.geocoded.map do |sock|
      {
        lat: sock.latitude,
        lng: sock.longitude,
        info_window: render_to_string(partial: "info_window", locals: { sock: sock })
      }
    end
  end

  def new
    @sock = Sock.new
  end

  def create
    @sock = Sock.new(sock_params)
    @sock.user = current_user
    if @sock.save
    redirect_to socks_path
    else
    render :new
    end
  end

  def show; end

  def destroy
    @sock.user = current_user
    if @sock.bookings.empty?
      @sock.destroy
      redirect_to socks_path
    else
      redirect_to sock_path(@sock)
    end
  end

  private

  def sock_params
    params.require(:sock).permit(:name, :price, :description, :address, :photo)
  end

  def set_sock
    @sock = Sock.find(params[:id])
  end

end
