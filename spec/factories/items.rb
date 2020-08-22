FactoryBot.define do
  factory :item do
    name               {Faker::word}
    introduction       {Faker::sentence} 
    price              {Faker::numberBetween(min = 300,max = 9999999)}
    category_id        {2}
    prefecture_id      {2}
    delivery_day       {2}         
    delivery_fee_id    {2}   
    states_id          {2}
    image              {Rack::Test::UploadedFile.new("/projects/furima_tech/penguin_king_hina.png", "image/png")}
  end
end
