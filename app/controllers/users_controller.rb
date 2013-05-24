class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @referrals = @user.referrals
  end
  def create
     @user.city = request.location.city
     @user.country = request.location.country
  end
end
