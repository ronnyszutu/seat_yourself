class DinersController < ApplicationController
	def new
		@diner = Diner.new
	end

	def create
		@diner = Diner.new diner_params	

		if @diner.save
			redirect_to diners_url
		else
			render :new
		end
	end

	def show
		@diner = Diner.find(params[:id])
	end

	def index
		@diner = Diner.all
	end

	def edit
		@diner = Diner.find(params[:id])
	end

	def update
		@diner = Diner.find(params[:id])

		if @diner.update_attributes diner_params
			redirect_to diner_path(@diner)
		else
			render :edit
		end
	end

	def destroy
		@diner = Diner.find(params[:id])
		@diner.destroy
		redirect_to diner_path
	end

	private
	def diner_params
		params.require(:diner).permit(:name, :email, :password, :password_confirmation)
	end
end