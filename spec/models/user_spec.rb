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
        # テストコードを記述
      end
      it 'emailが空では登録できない' do
        # テストコードを記述
      end
      it 'passwordが空では登録できない' do
        # テストコードを記述
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        # テストコードを記述
      end
      it 'nicknameが7文字以上では登録できない' do
        # テストコードを記述
      end
      it '重複したemailが存在する場合は登録できない' do
        # テストコードを記述
      end
      it 'emailは@を含まないと登録できない' do
        # テストコードを記述
      end
      it 'passwordが5文字以下では登録できない' do
        # テストコードを記述
      end
      it 'passwordが129文字以上では登録できない' do
        # テストコードを記述
      end
    end
  end
end


