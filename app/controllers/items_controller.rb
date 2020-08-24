class ItemsController < ApplicationController
    before_action :move_to_index, except: [:index]


    def index
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

    

    private
    def item_params
        params.require(:item).permit(:name, :introduction, :price, :category_id, :prefecture_id, :delivery_id, :delivery_fee_id,:delivery_day_id, :states_id, :image).merge(user_id: current_user.id)
    end


    def move_to_index
        unless user_signed_in?
        redirect_to action: :index
        end
    end
end