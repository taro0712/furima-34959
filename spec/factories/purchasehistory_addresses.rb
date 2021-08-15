FactoryBot.define do
  factory :purchasehistory_address do
    postcode { '123-4567' }
    delivery_area_id { 2 }
    city { '東京都' }
    block { '１−１' }
    building { 'テスト' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
