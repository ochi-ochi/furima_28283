class PurchasesController < ApplicationController 
  before_action :move_to_signin
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  
    if current_user.id != @item.user_id
        @purchase_address = PurchaseAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase = PurchaseAddress.new(purchaseaddress_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      redirect_to item_purchases_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :price, :image)
  end
 
  
  def purchaseaddress_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :building_name, :token, :tel_number).merge(user_id: current_user.id,item_id: params[:item_id] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(  
      amount: @item.price,
      card: purchaseaddress_params[:token],
      currency:'jpy'                 
    )
  end

  def move_to_signin
    redirect_to new_user_session_path unless user_signed_in?
  end
end

