class PurchaseAddress

    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number, :token

    with_options presence: true do
        POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/

        validates :postal_code, format: {with: POSTAL_CODE_REGEX}
        validates :prefecture_id
        validates :city
        validates :house_number
        validates :tel_number, length: {maximum: 11}
        validates :user_id
        validates :item_id
        validates :token
    end

    def save
       purchase = Purchase.create(user_id: user_id, item_id: item_id)
       PurchaseAdd.create(postal_code: postal_code, prefecture_id: prefecture_id, house_number: house_number, building_name: building_name, purchase_id: purchase.id, tel_number: tel_number, city: city)
    end  

end