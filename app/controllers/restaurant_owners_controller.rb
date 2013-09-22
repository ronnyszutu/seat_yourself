class RestaurantOwnersController < ApplicationController
	#shows a Registration form
	def new
		@restaurant_owner = RestaurantOwner.new
	end

	#once an account has been saved, redirects user to show page, otherwise stay on new page
	def create
		
		@restaurant_owner = RestaurantOwner.new restaurant_owner_params

			if @restaurant_owner.save
				flash[:notice] = "Your account has been created!"
				redirect_to restaurant_owner_path(@restaurant_owner)
			else
				render :new
			end
	end

	#show user's profile info
	def show
		@restaurant_owner = RestaurantOwner.find(params[:id])
	end

	#show list of restaurants user owns
	def index
		@restaurant_owner = RestaurantOwner.all
	end

	#render in view
	def edit
		@restaurant_owner = RestaurantOwner.find(params[:id])
	end

	#interacts with the model 
	def update
		@restaurant_owner = RestaurantOwner.find(params[:id])

		if @restaurant_owner.update_attributes restaurant_owner_params
			redirect_to restaurant_owner_path(@restaurant_owner)
		else
			render :edit
		end
	end

	def destroy
		@restaurant_owner = RestaurantOwner.find(params[:id])
		@restaurant_owner.destroy
		redirect_to new_restaurant_owner_path(@restaurant_owner)
	end

	private
	def restaurant_owner_params
		params.require(:restaurant_owner).permit(:name, :email, :password, :password_confirmation)
	end
end
