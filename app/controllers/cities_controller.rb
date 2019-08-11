class CitiesController < ApplicationController
  def show
    @cities = City.all
    @index = params[:id]
    @city = @cities.find(@index)
    @gossips = Gossip.all
    @users = User.all.find_by(city_id: @index)
  end
  
  def new
    @city = City.new
  end

  # def create
  #   @cities = City.all
  #   @city = City.new(city_id: 1, title: params[:gossip_title], content: params[:gossip_content])
  #   if @city.save
  #     render :index
  #   else
  #     render new_city_path
  #   end
  # end

  def index
    @cities = City.all
    @city = City.new
  end
end
