class RepliesController < ApplicationController
  def new
    @referral = Referral.find(params[:referral_id])
    @reply = @referral.replies.new(:user_id => params[:user_id], :referral_id => params[:referral_id])
    respond_to do |format|
      if @reply.save
        render :update do |page|
          page.replace_html 'referralBox', :partial => 'referral'
        end
        format.html { notice: 'Replied' }
      else
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end
end