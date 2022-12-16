require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できる時' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end
   context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordが数字だけだと登録できない' do
      @user.password ='11111111'
      @user.password_confirmation = '11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
    end
    it 'passwordが英字だけだと登録できない' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
    end
    it 'passwordが全角だと登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it 'last_nameが半角では登録できない' do
      @user.last_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナで入力して下さい")
    end
    it 'first_name_kanaが半角では登録できない' do
      @user.first_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力して下さい")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カタカナで入力して下さい")
    end
    it 'last_name_kanaが半角では登録できない' do
      @user.first_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力して下さい")
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it 'first_name_kanaがひらがなでは登録できない' do
      @user.first_name_kana = 'ああああ'
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力して下さい")
    end
    it 'last_name_kanaがひらがなでは登録できない' do
      @user.last_name_kana = 'ああああ'
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力して下さい")
    end
   end
  end
end
