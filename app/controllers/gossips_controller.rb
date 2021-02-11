class GossipsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :edit, :destroy]
 
  add_flash_types :warning, :info, :danger, :success

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
    @coms = Com.all # rajout pour le systeme de commentaire
  end 

  def new
    @gossip = Gossip.new
  end

  def create
  
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: session[:user_id])

    if @gossip.save
      redirect_to root_path, success: "Gossip enregistré!"
    else
      render :new
    end
  end


  def edit
    @gossip = Gossip.find(params[:id])
  end

  
  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content])
      redirect_to gossip_path
    else
      render :edit
    end
  end


  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end


  private

  def authenticate_user
    unless logged_in?
      redirect_to new_session_path, warning: "You must login to create a Gossip"
    end
  end


end
