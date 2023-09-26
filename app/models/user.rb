# app/models/user.rb

class User < ApplicationRecord
  # Deviseのモジュールを設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームのバリデーションを追加
  validates :nickname, presence: true

  # パスワードのバリデーション
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/ }

  # お名前カナのバリデーション
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }

  # お名前（漢字）のバリデーション
  validates :last_name_kanji, presence: true, format: { with: /\A[一-龯ぁ-んァ-ヶー－]+\z/ }
  validates :first_name_kanji, presence: true, format: { with: /\A[一-龯ぁ-んァ-ヶー－]+\z/ }

  # 生年月日のバリデーション
  validates :birth_date, presence: true
end
