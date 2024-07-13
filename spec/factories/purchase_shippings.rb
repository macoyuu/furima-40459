FactoryBot.define do
  factory :purchase_shipping do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { 'あ市' }
    street { '1-1' }
    building { '日本ハイツ' }
    tel_number { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
