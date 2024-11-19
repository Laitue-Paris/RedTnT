class ClothesController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = current_user
    @clothe = Clothe.new
    @clothe.user = @user
  end

  private

  def clothes_params
    params.require(:clothe).permit(:name,)
  end
end
