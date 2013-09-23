class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new reservation_params

      if @reservation.save
        flash[:notice] = "Your reservation has been saved!"
        redirect_to reservation_path(@reservation)
      else
        render :new
      end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
    @reservation = Reservation.all
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes reservation_params
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_path(@reservation)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:diner_id, :restaurant_id, :reservation_time, :end_time, :party_size)
  end
end
