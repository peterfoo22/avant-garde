class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end

  def show
    @investment = Investment.find(params[:id])
  end

  def new
    @investment = Investment.new
    @campaign = Campaign.find(params[:campaign_id])
    @investments_user = Investment.where("user_id = ?", current_user.id).order("date DESC")
    @campaigns_user = Campaign.joins(:investments).where("user_id = ?", current_user.id).order("end_date DESC")
  end

  def create
    @investment = Investment.new(investment_params)
    @campaign = Campaign.find(params[:campaign_id])
    @user = current_user
    @investment.campaign = @campaign
    @investment.user = @user
      if @investment.save!
        respond_to do |format|
      # format.html { redirect_to dashboard_path(@user) }
        format.js
        end
      else
        respond_to do |format|
        format.html { render 'campaign_path(@campaign)'}
        format.js
      end
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end
end
