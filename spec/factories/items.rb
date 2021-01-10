FactoryBot.define do
  factory :item do
    association :user
    name               {"商品名"}
    text               {"商品の説明"}
    value              {300}
    category_id           {2}
    condition_id          {2}
    shipment_day_id       {2}
    postage_id            {2}
    prefecture_id         {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
