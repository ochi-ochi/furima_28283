class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    has_one_attached :image
    belongs_to :user

    belongs_to_active_hash :category
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_day
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :state


    with_options presence: true do
        validates :user
        validates :name
        validates :introduction
        validates :price
        validates :categories, :delivery_day, :delivery_fee, :state_id, numericality: { other_than: 1 }
    end

    
end
