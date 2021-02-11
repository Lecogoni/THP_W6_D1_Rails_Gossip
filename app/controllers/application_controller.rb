class ApplicationController < ActionController::Base

  include SessionsHelper

  def index
      @gossips = Gossip.all
  end

end
