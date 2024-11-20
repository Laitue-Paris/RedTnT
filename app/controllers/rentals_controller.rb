class RentalsController < ApplicationController
  def create
    @clothe = Clothe.find(params[:clothe_id])
    @rental = Rental.new(rentals_params)
    @rental.user = current_user
    @rental.clothe = @clothe
    if @rental.save
      redirect_to rental_path(@rental), notice: "Rental created"
    else
      render "clothes/show", status: :unprocessable_entity
    end
  end

  def update
  end

  private

  def rentals_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
