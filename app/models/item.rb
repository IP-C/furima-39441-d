class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :item_info, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  has_one_attached :image

  belongs_to :category
  validates :category_id, presence: true, inclusion: { in: Category.all.map(&:id) }
  validates :condition_id, presence: true, inclusion: { in: ItemCondition.all.map(&:id) }
  validates :shipping_id, presence: true, inclusion: { in: Shipping.all.map(&:id) }
  validates :prefecture_id, presence: true, inclusion: { in: Prefecture.all.map(&:id) }
  validates :delivery_day_id, presence: true, inclusion: { in: ScheduledDelivery.all.map(&:id) }

end
