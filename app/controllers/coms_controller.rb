class ComsController < ApplicationController

  before_action :authenticate_user, only: [:show, :new, :create]

  def index
    @coms =  @gossip.coms
  end

  def show
    @com = Com.find(params[:id])
  end

  def new
    @com =  Com.new
    @gossip = Gossip.find(params[:gossip_id])
  end


  add_flash_types :warning, :info, :danger, :success


  def create

    puts params[:content]
    puts "---------------------"
    puts params[:gossip_id]
    puts @gossip
    puts "---------------------"
    @gossip = Gossip.find(params[:gossip_id])
    @com = @gossip.coms.create(content: params[:content], user_id: session[:user_id])
    redirect_to gossip_path(@gossip)
  end

  private
    
    def com_params
      params.require(:content, :user.id).permit(:content, :user.id)
    end


  def authenticate_user
    unless logged_in?
      redirect_to new_session_path, warning: "You must login to create a Gossip"
    end
  end


end

  # def edit
  #   @gossip = Com.find(params[:id])
  # end

  # def update
  #   @gossip = Com.find(params[:id])
  #   if @gossip.update(title: params[:title], content: params[:content])
  #     redirect_to gossip_path
  #   else
  #     render :edit
  #   end
  # end


  # def destroy
  #   @gossip = Com.find(params[:id])
  #   @gossip.destroy
  #   redirect_to root_path
  # end






