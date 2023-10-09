# spec/models/item_spec.rb
require 'rails_helper'

FactoryBot.define do
  factory :item do
    name { "Example Item" }
    item_info { "This is an example item." }
    price { 1000 }
    category_id { 1 } # 適切なカテゴリIDに変更
    condition_id { 1 } # 適切な商品状態IDに変更
    shipping_id { 1 } # 適切な配送方法IDに変更
    prefecture_id { 1 } # 適切な都道府県IDに変更
    delivery_day_id { 1 } # 適切な配送日数IDに変更
    association :user, factory: :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'support', 'example.jpg')), filename: 'example.jpg', content_type: 'image/jpeg')
    end
  end
end

