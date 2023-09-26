# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      # ファクトリーを使用してテストデータを生成
      @user = FactoryBot.build(:user)

      # ユーザーオブジェクトが有効であることを検証
      expect(@user).to be_valid
    end

    context 'ユーザー新規登録' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        # ファクトリーを使用してテストデータを生成
        @user = FactoryBot.build(:user)

        # テストコードを記述
        expect(@user).to be_valid
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = '' # nicknameを空に設定
        expect(@user).not_to be_valid # ユーザーが有効でないことを検証
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        expect(@user).not_to be_valid
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        expect(@user).not_to be_valid
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'mismatched_password'
        expect(@user).not_to be_valid
      end

      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'a' * 8
        expect(@user).not_to be_valid
      end

      it '重複したemailが存在する場合は登録できない' do
        # ダミーユーザーを作成
        existing_user = FactoryBot.create(:user, email: 'test@example.com')

        # 重複したemailでユーザーを生成し、無効であることを検証
        @user.email = 'test@example.com'
        expect(@user).not_to be_valid
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'email_without_at.com'
        expect(@user).not_to be_valid
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        expect(@user).not_to be_valid
      end

      it 'passwordが129文字以上では登録できない' do
        long_password = 'a' * 130
        @user.password = long_password
        expect(@user).not_to be_valid
      end
    end
  end
end

