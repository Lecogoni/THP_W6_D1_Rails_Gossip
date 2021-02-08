class ApplicationController < ActionController::Base

  def index
      @gossips = Gossip.all
  end

end
