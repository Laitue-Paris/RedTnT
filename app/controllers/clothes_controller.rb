class ClothesController < ApplicationController
  def index
    @clothes = Clothe.all
    @rentals = Rental.all
    params[:color].present? ? @clothes = @clothes.where(color: params[:color]) : ""
    params[:brand].present? ? @clothes = @clothes.where(brand: params[:brand]) : ""
    if params[:start_date].present? && params[:end_date].present?
      @rentals = @rentals.where("start_date <= ? AND end_date >= ?", params[:start_date], params[:end_date])
      @clothes = @clothes.reject do |clothe|
        # Pour la relecture : dans les parenthèses on vérifie si la condition s'applique au deux
        (clothe.rentals & @rentals).any?
      end
    end
  end

  def show
    @rental = Rental.new
    @clothe = Clothe.find(params[:id])
    @clothes = Clothe.all
    @random_clothes = Clothe.all.sample(5)
    @rental_count = @clothe.rentals.count
    @user = current_user
  end

  def create
    @user = current_user
    @clothe = Clothe.new(clothes_params)
    @clothe.user = @user
    if @clothe.save
      redirect_to clothe_path(@clothe)
    else
      render "dashboard/index", status: :unprocessable_entity
    end
  end

  private

  def clothes_params
    params.require(:clothe).permit(:name, :description, :brand, :category, :size, :price, :color, :photo)
  end
end
