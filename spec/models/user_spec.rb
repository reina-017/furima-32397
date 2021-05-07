require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@がなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passeordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'password:半角英数混合(数字のみ)' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは半角英数混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが違えば登録できない' do
        @user.password_confirmation = 'aaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'family_nameは全角のみ' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end
      it 'first_nameは全角のみ' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'family_name_kanaはカタカナのみ' do
        @user.family_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana カタカナを使用してください')
      end
      it 'family_name_kanaは全角（カタカナ以外）では登録できない' do
        @user.family_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana カタカナを使用してください')
      end
      it 'first_name_kanaはカタカナのみ' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナを使用してください')
      end
      it 'first_name_kanaは全角（カタカナ以外）では登録できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana カタカナを使用してください')
      end
    end
  end
end
