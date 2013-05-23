class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @referrals = @user.referrals
  end
  def index
    @client_city = request.location.city
    @client_country = request.location.country
  end
end
