class Product < ApplicationRecord
  validates :name, presence: true
  has_one_attached :image
  # 他のバリデーションやアソシエーションを追加
end

