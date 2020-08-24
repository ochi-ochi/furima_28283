FactoryBot.define do
  factory :item do
    name               {"やかん"}
    introduction       {"閲覧ありがとうございます"} 
    price              {500}
    category_id        {Category.all.sample}
    prefecture_id      {Prefecture.all.sample}
    delivery_day_id    {DeliveryDay.all.sample}         
    delivery_fee_id    {DeliveryFee.all.sample}   
    states_id          {State.all.sample}

    association :user
  end
end
