class PurchaseAdd < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :purchase
    belongs_to_active_hush :prefecture

    with_options presence: true do
        validates :postal_code, format: { /\A[0-9]{3}-[0-9]{4}\z/}
        validates :prefecture_id
        validates :city
        validates :house_number
        validates :tel_number, length{ maximum: 11}
        validates :purchase
    end
end
