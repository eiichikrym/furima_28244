class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :new, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render action: :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:price, :name, :description, :category_id, :status_id, :ship_charge_id, :ship_region_id, :ship_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end