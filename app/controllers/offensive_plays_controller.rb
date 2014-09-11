class OffensivePlaysController < ApplicationController

  def default_serializer_options
    {root: false}
  end

  def index  
    @offensive_plays = OffensivePlay.all

    render json: @offensive_plays
  end

end
