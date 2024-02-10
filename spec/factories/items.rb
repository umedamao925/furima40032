FactoryBot.define do
  factory :item do
    item_name               {'テスト'}
    explain                 {'テスト'}
    category_id             {'2'}
    condition_id            {'2'}
    cost_bearer_id          {'2'}
    shipping_area_id        {'2'}
    delivery_day_id         {'2'}
    price                   {'300'}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

