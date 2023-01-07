require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる時' do
      it 'title、description、category_id、status_id、fee_id、shipping_date_id、item_feeが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない時' do
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'fee_idが空では出品できない' do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空では出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'item_feeが空では出品できない' do
        @item.item_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item fee can't be blank")
      end
      it 'item_feeが¥300未満では出品できない' do
        @item.item_fee = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'item_feeが¥10000000以上では出品できない' do
        @item.item_fee = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'item_feeが英字だけだと出品できない' do
        @item.item_fee = 'aaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'item_feeが全角だと出品できない' do
        @item.item_fee = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
