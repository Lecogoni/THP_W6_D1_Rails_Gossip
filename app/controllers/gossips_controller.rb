class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  add_flash_types :warning, :info, :danger, :success

  def create
    # recupere le user Anonymous
    user = User.find(21)
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: user.id)

    if @gossip.save
      #flash[:alert] = 
      redirect_to root_path, success: "Gossip enregistré!"
    else
      #flash[:error] = "c'est raté"
      render :new
    end
  end

end
