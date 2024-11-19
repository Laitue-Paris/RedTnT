class DashboardController < ApplicationController
  def index
    @clothe = Clothe.new
  end
end
