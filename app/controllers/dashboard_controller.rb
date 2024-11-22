class DashboardController < ApplicationController
  def index
    @clothes = Clothe.all
    @user = current_user
    @clothe = Clothe.new
    @rentals = Rental.all
    @rentals = @rentals.where("start_date <= ? AND end_date >= ? AND user_id = ?", Date.today, Date.today, current_user.id)
    @my_rentals = @rentals.where("user_id = ?", current_user.id).map do |rental|
      rental.clothe
    end
    @total_rented = Rental.all.joins(:clothe).where("clothes.user_id = ?", current_user).map do |rental|
      rental.clothe[:price]
    end
    @item_rented = @user.rentals.map do |rental|
      rental.clothe
    end
    @last_item = @user.rentals.last
  end
end
