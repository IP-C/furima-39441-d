# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is valid with valid attributes" do
    item = FactoryBot.build(:item) # FactoryBotを使ってテストオブジェクトを作成
    expect(item).to be_valid
  end

  it "is not valid without a name" do
    item = FactoryBot.build(:item, name: nil) # FactoryBotを使ってテストオブジェクトを作成
    expect(item).to_not be_valid
  end

  # Add more test cases for other validations and model methods as needed
end

