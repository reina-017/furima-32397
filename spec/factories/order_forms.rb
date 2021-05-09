FactoryBot.define do
  factory :order_form do
    postcode          { "111-1111"}
    prefecture_id     { Faker::Number.between(from: 2, to: 47) }
    city              { Gimei.city.kanji }
    block             { Gimei.town.kanji }
    building          { Gimei.town.kanji }
    phone_number      { "0000000000"}
    token {"tok_abcdefghijk00000000000000000"}

  
  end
end
