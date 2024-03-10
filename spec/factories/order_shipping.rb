FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-1234'}
    prefecture_id { 3 }
    municipality { '横浜市緑区' }
    street_address { '3-4' }
    building { '青山ビル' }
    phone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end
