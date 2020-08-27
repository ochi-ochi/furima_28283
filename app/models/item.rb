class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :user
  has_one :purchase

  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :state

  with_options presence: true do
    validates :image
    validates :user
    validates :name
    validates :introduction
    validates :price, inclusion: { in: 300..9_999_999 }
    validates :category_id, :delivery_day_id, :delivery_fee_id, :state_id, numericality: { other_than: 1 }
    validates :prefecture_id
  end
end
