require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できない時' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'fee_idが空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'item_feeが空では登録できない' do
        @item.item_fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item fee can't be blank")
      end
      it 'item_feeが¥300未満では登録できない' do
        @item.item_fee = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'item_feeが¥10000000以上では登録できない' do
        @item.item_fee = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'item_feeが英字だけだと登録できない' do
        @item.item_fee = 'aaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
      it 'item_feeが全角だと登録できない' do
        @item.item_fee = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item fee is invalid')
      end
    end
  end
end
