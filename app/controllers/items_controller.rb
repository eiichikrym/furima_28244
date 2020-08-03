class ItemsController < ApplicationController

  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Itme.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:price, :image, :name, :description, :category_id, :status_id, :ship_charge_id, :ship_region_id, :ship_day_id)
  end
end