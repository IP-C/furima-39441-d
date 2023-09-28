class Product < ApplicationRecord
  validates :name, presence: true
  # 他のバリデーションやアソシエーションを追加
end

