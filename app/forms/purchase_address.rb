class PurchaseAddress

    include ActiveModel::Model
    attr_accessor  :user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_name, :purchase, :tel_number

    with_options presence: true do
        validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
        validates :prefecture_id
        validates :city
        validates :house_number
        validates :tel_number, length: {maximum: 11}
        validates :purchase
        validates :user
    end

    def save
       purchase = Purchase.create(user: user, item: item)
       PurchaseAdd.create(postal_code: postal_code, prefecture_id: prefecture_id, house_number: house_number, building_name: building_name, prefecture_id: prefecture_id,purchase: purchase.id,tel_number: tel_number)
    end  

end