require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
# 省略
      it 'nickname:必須' do
        @user.nickname = ''
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
# 省略
end
