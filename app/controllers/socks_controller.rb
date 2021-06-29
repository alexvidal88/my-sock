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
    @sock.save
    redirect_to socks_path
  end

  private

  def sock_params
    params.require(:sock).permit(:name, :price, :description, :user_id)
  end

end
