class ReferralsController < ApplicationController
  before_filter :authenticate_user!

  
  # GET /referrals
  # GET /referrals.json
  def index
    @referrals = Referral.order("created_at asc").page(params[:page]).per_page(10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @referrals }
    end
  end

  # GET /referrals/new
  # GET /referrals/new.json
  def new
    @referral = Referral.new
    
    Pusher['test_channel'].trigger('greet', {
      :greeting => "Hello there!"
    })
    Pusher['test_channel'].trigger('greet', {:message => 'hello world'})
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @referrals }
    end
  end

  # GET /referrals/1/edit
  def edit
    @referral = Referral.find(params[:id])
  end

  # POST /referrals
  # POST /referrals.json
  def create
    @referral = Referral.new(params[:referral])

    respond_to do |format|
      if @referral.save
        format.html { redirect_to referrals_path, notice: 'Referral was successfully created.' }
        format.json { render json: @referrals, status: :created, location: @referral }
      else
        format.html { render action: "new" }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /referrals/1
  # PUT /referrals/1.json
  def update
    @referral = Referral.find(params[:id])

    respond_to do |format|
      if @referral.update_attributes(params[:referral])
        format.html { redirect_to referrals_path, notice: 'Referral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @referral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referrals/1
  # DELETE /referrals/1.json
  def destroy
    @referral = Referral.find(params[:id])
    @referral.destroy

    respond_to do |format|
      format.html { redirect_to referrals_url }
      format.json { head :no_content }
    end
  end
  
end
