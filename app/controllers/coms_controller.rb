class ComsController < ApplicationController

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
    puts "--------------------"
    puts params
    puts "--------------------"
    user = User.find(21)
    @gossip = Gossip.find(params[:gossip_id])
    @com = @gossip.coms.create(content: params[:content], user_id: user.id)
    redirect_to gossip_path(@gossip)
  end

  private
    
    def com_params
      params.require(:content, :user.id).permit(:content, :user.id)
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






