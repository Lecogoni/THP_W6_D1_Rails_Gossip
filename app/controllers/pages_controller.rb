class PagesController < ApplicationController

    def home
      @gossips = Gossip.all
    end

    def show
      @gossip = Gossip.find(params[:id])
      puts params
    end

end