FactoryBot.define do
  factory :product do
    title                   { Faker::Lorem.sentence }
    text                    { Faker::Lorem.sentence }
    category_id             { '2' }
    status_id               { '2' }
    delivery_fee_role_id    { '2' }
    delivery_source_area_id { '2' }
    delivery_days_id        { '2' }
    price                   { '300' }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
