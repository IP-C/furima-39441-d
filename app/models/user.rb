class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ニックネームのバリデーションを追加
  validates :nickname, presence: true
  # メールアドレスのバリデーション
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  # パスワードのバリデーション
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  # お名前やお名前カナのバリデーション
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  # 生年月日のバリデーション
  validates :birth_date, presence: true
end
