class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @referrals = @user.referrals
  end
end
