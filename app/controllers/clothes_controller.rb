class ClothesController < ApplicationController
  def index
  end

  def show
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
    params.require(:clothe).permit(:name, :description, :brand, :category, :size, :price, :color, :photos)
  end
end
