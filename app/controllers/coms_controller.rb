class ComsController < ApplicationController

  before_action :authenticate_user, only: [:show, :new, :create, :edit]

  def index
    @coms =  @gossip.coms
  end

  def show
    @com = Com.find(params[:id])
  end

  def new
    @com =  @gossip.coms.build
  end

  add_flash_types :warning, :info, :danger, :success

  def create
    #user = User.find(21)
    @gossip = Gossip.find(params[:gossip_id])
    @com = @gossip.coms.create(content: params[:content], user_id: session[:user_id])
    redirect_to gossip_path(@gossip)
  end

  def edit
    @com = Com.find(params[:id])
  end

  def update
    @com = Com.find(params[:id])
    if @com.update(content: params[:content])
      redirect_to gossip_path
    else
      render :edit
    end
  end

  def destroy
    @com = Com.find(params[:id])
    @com.destroy
    redirect_to gossip_path
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










