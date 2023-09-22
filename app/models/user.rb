# app/models/user.rb

class User < ApplicationRecord
  # Deviseのモジュールを設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームのバリデーションを追加
  validates :nickname, presence: true

  # メールアドレスのバリデーション
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, uniqueness: true

  # パスワードのバリデーション
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/ }

  # お名前カナのバリデーション
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }

  # お名前（漢字）のバリデーション
  validates :last_name_kanji, presence: true
  validates :first_name_kanji, presence: true

  # 生年月日のバリデーション
  validates :birth_date, presence: true
end
