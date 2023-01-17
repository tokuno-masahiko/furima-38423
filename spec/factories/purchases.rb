FactoryBot.define do
  factory :purchase do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    price { 2000 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
