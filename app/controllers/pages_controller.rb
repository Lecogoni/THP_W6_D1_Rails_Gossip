class PagesController < ApplicationController

    def home
      @gossips = Gossip.all
    end

end