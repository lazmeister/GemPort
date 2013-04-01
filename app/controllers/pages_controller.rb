class PagesController < ApplicationController
  def home
    @referrals = Referral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @referrals }
    end
  end
  
  def about
  end
end
