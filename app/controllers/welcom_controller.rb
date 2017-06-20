class WelcomController < ApplicationController
  def index
    flash[:alert] = "zao"
  end
end
