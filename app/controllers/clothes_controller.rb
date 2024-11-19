class ClothesController < ApplicationController
  def index
  end

  def show
    @clothe = Clothe.find(params[:id])
  end

  def create
  end
end
