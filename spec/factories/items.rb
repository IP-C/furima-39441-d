# spec/factories/items.rb
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
    user_id { 1 } # 適切なユーザーIDに変更
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'example.jpg')) }
  end
end

