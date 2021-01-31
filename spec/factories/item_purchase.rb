FactoryBot.define do
  factory :item_purchase do
    association :user
    association :item

    # purchase_id
    postcode          { '000-0000' }
    prefecture_id     { 2 }
    city              { '市町村' }
    block             { '番地' }
    building          { '建物名' }
    phone             { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
