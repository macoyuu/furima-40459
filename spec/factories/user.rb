FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '一郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'イチロウ' }
    birth_date { Faker::Date.birthday }
  end
end
