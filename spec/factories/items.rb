FactoryBot.define do
  factory :item do
    title              { Faker::Name.initials(number: 2) }
    description        { Faker::Name.initials(number: 2) }
    category { Category.all.sample }
    status { Status.all.sample }
    fee { Fee.all.sample }
    prefecture { Prefecture.all.sample }
    shipping_date { ShippingDate.all.sample }
    item_fee { '3000' }
    association :user
  end
end
