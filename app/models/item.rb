class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  has_one_attached :image

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :category_id, presence: true, inclusion: { in: ->(item) { Category.where(id: 1..Float::INFINITY).pluck(:id) } }
  validates :condition_id, presence: true, inclusion: { in: ->(item) { Condition.where(id: 1..Float::INFINITY).pluck(:id) } }
  validates :shipping_id, presence: true, inclusion: { in: ->(item) { Shipping.where(id: 1..Float::INFINITY).pluck(:id) } }
  validates :prefecture_id, presence: true, inclusion: { in: ->(item) { Prefecture.where(id: 1..Float::INFINITY).pluck(:id) } }
  validates :delivery_day_id, presence: true, inclusion: { in: ->(item) { DeliveryDay.where(id: 1..Float::INFINITY).pluck(:id) } }

end
