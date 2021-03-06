require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birth_dayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が記入してないと登録できないこと' do
        @user.email = 'text.text.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end


      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみであれば登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英数文字を使用してください')
      end

      it 'passwordが英語のみであれば登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英数文字を使用してください')
      end

      it 'passwordが全角であれば登録できないこと' do
        @user.password = 'ＡＡＡＡＡＡ'
        @user.password_confirmation = 'ＡＡＡＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英数文字を使用してください')
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameが半角では登録できないこと' do
        @user.family_name = 'ｱｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角を使用してください")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角では登録できないこと' do
        @user.first_name = 'ｱｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角を使用してください")
      end


      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaがひらがなでは登録できないこと' do
        @user.family_name_kana = 'あき'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角（カタカナ）を使用してください")
      end

      it 'family_name_kanaが漢字では登録できないこと' do
        @user.family_name_kana = '秋'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角（カタカナ）を使用してください")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがひらがなでは登録できないこと' do
        @user.first_name_kana = 'あき'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）を使用してください")
      end

      it 'first_name_kanaが漢字では登録できないこと' do
        @user.first_name_kana = '秋'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）を使用してください")
      end

      it 'birth_dayが空では登録できないこと' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

    end
  end
end
