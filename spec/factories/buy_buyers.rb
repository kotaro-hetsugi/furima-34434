FactoryBot.define do
  factory :buy_buyer do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '111-1111' }
    prefectures_id { 2 }
    municipality   { '札幌市' }
    address        { '1234' }
    building_name  { 'テストビル' }
    phone_number { 11_122_223_333 }
  end
end
