class WorldsController < ApplicationController
  respond_to :json, only: :show_data

  def new
    @world = World.new
  end

  def show_data
    @world = World.new(params[:world])
    respond_with(@world)
  end
end
