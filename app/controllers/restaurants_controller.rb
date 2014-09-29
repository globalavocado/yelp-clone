class RestaurantsController < ApplicationController

def index
	@restaurants = Restaurant.all
end

def new
	@restaurant = Restaurant.new
end	

def create
	@restaurant = Restaurant.create(params[:restaurant].permit(:name))
	redirect_to restaurants_path
end

end
