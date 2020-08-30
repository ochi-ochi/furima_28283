class PurchasesController < ApplicationController 
  
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
   end

  def create
    @purchase = PurchaseAddress.new(purchaseadress_params)
    
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
 
  
  def purchaseadress_params
    params.require(:purchase).permit(:item, :postal_code, :prefecture_id, :city, :house_number, :building_number, :building_name,:purchase, :token, :tel_number).merge(user: current_user.id)
  end

  def pay_item
    Payjp.api_key = EVN["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(  
      card: purchase_params[:token],    
      currency:'jpy'                 
    )
  end
end
