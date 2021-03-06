class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :destroy, :show]

  def index
    @items = Item.all.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
       item = Item.find(params[:id])
       
    if current_user.id == item.user_id
       item.update(item_params)
       redirect_to root_path
    else
      redirect_to item_path
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path
    end
  end
 
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :prefecture_id, :delivery_id, :delivery_fee_id, :delivery_day_id, :state_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
