class PurchaseAdd < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :purchase
    belongs_to :user
    belongs_to_active_hush :prefecture

   
end
