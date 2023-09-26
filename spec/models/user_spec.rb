# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    # ファクトリーを使用してテストデータを生成し、@user変数に格納
    @user = FactoryBot.build(:user)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      # すでにbeforeブロックで生成された@userを使用
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
        @user.valid? # ユーザーが無効であることを検証
        expect(@user.errors[:nickname]).to include("can't be blank") # エラーメッセージを確認
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'mismatched_password'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'a' * 8 # nicknameを7文字以上に設定
        @user.valid?
      end

      it '重複したemailが存在する場合は登録できない' do
        # ダミーユーザーを作成
        existing_user = FactoryBot.create(:user, email: 'test@example.com')

        # 重複したemailでユーザーを生成し、無効であることを検証
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors[:email]).to include('has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'email_without_at.com'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        long_password = 'a' * 130
        @user.password = long_password
        @user.valid?
        expect(@user.errors[:password]).to include('is too long (maximum is 128 characters)')
      end

      # 以下、新たに追加した異常系テストケース
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード123'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end

      it '姓（全角）が空だと登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors[:last_name_kanji]).to include("can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name_kanji = '山田A'
        @user.valid?
        expect(@user.errors[:last_name_kanji]).to include('is invalid')
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors[:first_name_kanji]).to include("can't be blank")
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name_kanji = '太郎Taro'
        @user.valid?
        expect(@user.errors[:first_name_kanji]).to include('is invalid')
      end

      it '姓（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'やまだYamada'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('is invalid')
      end

      it '名（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'たろうTaro'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('is invalid')
      end
    end
  end
end

