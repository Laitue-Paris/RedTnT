class RentalsController < ApplicationController
  def create
    @clothe = Clothe.find(params[:clothe_id])
    @rental = Rental.new(rentals_params)
    @rental.user = current_user
    @rental.clothe = @clothe
    if @rental.save
      respond_to do |format|
        format.html { redirect_to dashboard_index_path }
        format.json { render json: { success: true, url: dashboard_index_path}}
      end
    else
      respond_to do |format|
        format.html { redirect_to clothe_path(@clothe) }
        format.json { render json: { success: false, form: render_to_string(partial: "clothes/rentalform", locals: {rental: @rental}, formats: [:html] )}}
      end
    end
  end

  def update
  end

  private

  def rentals_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
