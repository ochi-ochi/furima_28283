class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit 
    @item = Item.find(params[:id])
  end

  def update
    if Item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
 
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :prefecture_id, :delivery_id, :delivery_fee_id, :delivery_day_id, :state_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
