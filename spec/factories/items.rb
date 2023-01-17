FactoryBot.define do
  factory :item do
    image                           {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.jpg')) }
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
