FactoryBot.define do
  factory :product do
    name                {'test1'}
    text                {'test2'}
    category_id         {2}
    status_id           {2}
    shopping_charge_id  {2}
    delivery_area_id    {2} 
    delivery_day_id     {2}
    price               {500} 
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/furima-header01.png'), filename: 'furima-header01.png')
    end
  end
end

