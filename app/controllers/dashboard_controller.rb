class DashboardController < ApplicationController
  def index
    @user = current_user
    @clothe = Clothe.new
    @rentals = Rental.all
    @rentals = @rentals.where("start_date <= ? AND end_date >= ? AND user_id = ?", Date.today, Date.today, current_user.id)
  end
end
