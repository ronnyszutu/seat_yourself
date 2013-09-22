class RestaurantsController < ApplicationController
	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new restaurant_params
		@restaurant.save
		redirect_to restaurant_path(@restaurant)
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def index
		@restaurants = Restaurant.all
		# redirect_to restaurant_path(@restaurant)
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes restaurant_params
			redirect_to restaurant_path(@restaurant)
		else
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to new_restaurant_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :cuisine, :phonenumber)
	end
end
