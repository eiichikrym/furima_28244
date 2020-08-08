class TradesController < ApplicationController
  before_action :check_trade

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && (current_user.id == @item.user_id)
      redirect_to root_path
    elsif user_signed_in?
      @trade = TradingInformation.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @trade = TradingInformation.new(trade_params)
    if @trade.valid?
      @trade.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def check_trade
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.trade.nil?
  end

  def trade_params
    params.require(:trading_information).permit(:postcode, :state_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
