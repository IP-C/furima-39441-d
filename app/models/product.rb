class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  has_one_attached :image
  belongs_to :category
  # 他のバリデーションやアソシエーションを追加
end

