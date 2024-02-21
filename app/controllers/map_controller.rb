class MapController < ApplicationController
  def index
    @surf_spots = Spot.all
  end
end
