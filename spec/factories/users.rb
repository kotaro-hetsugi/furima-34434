FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { 'test12345' }
    password_confirmation { password }
    last_name             { Gimei.name.last.kanji }
    first_name            { Gimei.name.first.kanji }
    last_name_kana        { Gimei.name.last.katakana }
    first_name_kana       { Gimei.name.first.katakana }
    birthday              { '2021/02/23' }
  end
end
