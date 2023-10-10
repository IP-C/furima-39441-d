require 'rails_helper'

RSpec.describe Item, type: :model do
  it "正しい属性値で有効であること" do
    item = FactoryBot.create(:item)
    expect(item).to be_valid
  end

  it "商品名がない場合、無効であること" do
    item = FactoryBot.build(:item, name: nil)
    expect(item).to_not be_valid
  end

  it "商品名が40文字以下であれば有効であること" do
    item = FactoryBot.build(:item, name: "a" * 40)
    expect(item).to be_valid
  end

  it "商品名が40文字を超える場合、無効であること" do
    item = FactoryBot.build(:item, name: "a" * 41)
    expect(item).to_not be_valid
  end

  it "商品の説明がない場合、無効であること" do
    item = FactoryBot.build(:item, item_info: nil)
    expect(item).to_not be_valid
  end

  it "商品の説明が1,000文字以下であれば有効であること" do
    item = FactoryBot.build(:item, item_info: "a" * 1000)
    expect(item).to be_valid
  end

  it "商品の説明が1,000文字を超える場合、無効であること" do
    item = FactoryBot.build(:item, item_info: "a" * 1001)
    expect(item).to_not be_valid
  end

  it "カテゴリーが選択されていない場合、無効であること" do
    item = FactoryBot.build(:item, category: nil)
    expect(item).to_not be_valid
  end

  it "商品の状態が選択されていない場合、無効であること" do
    item = FactoryBot.build(:item, condition: nil)
    expect(item).to_not be_valid
  end

  it "配送料の負担が選択されていない場合、無効であること" do
    item = FactoryBot.build(:item, shipping_id: nil)
    expect(item).to_not be_valid
  end

  it "発送元の地域が選択されていない場合、無効であること" do
    item = FactoryBot.build(:item, prefecture_id: nil)
    expect(item).to_not be_valid
  end

  it "発送までの日数が選択されていない場合、無効であること" do
    item = FactoryBot.build(:item, delivery_day_id: nil)
    expect(item).to_not be_valid
  end

  it "販売価格がない場合、無効であること" do
    item = FactoryBot.build(:item, price: nil)
    expect(item).to_not be_valid
  end

  it "販売価格が300未満の場合、無効であること" do
    item = FactoryBot.build(:item, price: 299)
    expect(item).to_not be_valid
  end

  it "販売価格が9,999,999を超える場合、無効であること" do
    item = FactoryBot.build(:item, price: 10_000_000)
    expect(item).to_not be_valid
  end

  it "販売価格が300から9,999,999の範囲内であれば有効であること" do
    item = FactoryBot.build(:item, price: 5_000)
    expect(item).to be_valid
  end
end
