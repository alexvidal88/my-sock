class SocksController < ApplicationController

  before_action :set_sock, only: [:show, :edit, :update, :destroy]

  def index
    @socks = Sock.all
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
    @sock.destroy
    redirect_to socks_path
  end

  private

  def sock_params
    params.require(:sock).permit(:name, :price, :description, :photo)
  end

  def set_sock
    @sock = Sock.find(params[:id])
  end

end
