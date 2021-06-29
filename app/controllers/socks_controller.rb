class SocksController < ApplicationController

  def index
    @socks = Sock.all
  end

  def new
    @sock = Sock.new
  end

  def show
    @sock = Sock.find(params[:id])
  end

  def create
    @sock = Sock.new(sock_params)
    @sock.user = current_user
    @sock.save
    redirect_to sock_path(@sock)
  end

  private

  def sock_params
    params.require(:sock).permit(:name, :price, :description, :photo)
  end

end
