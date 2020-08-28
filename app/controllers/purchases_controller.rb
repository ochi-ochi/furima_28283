class PurchasesController < ApplicationController 
  
  def index
    @item = Item.find(params[:id])
  end

  def create
    @purchase = PurchaseAdd.new(purchase_params)
    @purchase.save
  end

  private
  def purchase_params
    params.require(:purchase_add).permit(:user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_number, :purchase)
  end
end
