class DashboardController < ApplicationController
  def index
    @user = current_user
    @clothe = Clothe.new
  end
end
