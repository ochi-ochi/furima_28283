class PurchaseAdd
    include ActiveModel::ActiveModel
    attr_accessor  :user, :item, :postal_code, :prefecture_id, :city, :house_number, :building_number, :purchase

    with_options presence: true do
        validates :postal_code, format: { /\A[0-9]{3}-[0-9]{4}\z/}
        validates :prefecture_id
        validates :city
        validates :house_number
        validates :tel_number, length{ maximum: 11}
        validates :purchase
    end

    def save
       purchase  = Purchase.create(name: name, item: item)
       PurchaseAdd.create(postal_code: postal_code, prefecture_id: prefecture_id, house_number: house_number, building_number: building_number, prefecture_id: prefecture_id)
       

end