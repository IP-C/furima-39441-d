require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is valid with valid attributes" do
    item = FactoryBot.create(:item)
    expect(item).to be_valid
  end

  it "is not valid without a name" do
    item = FactoryBot.build(:item, name: nil) 
    expect(item).to_not be_valid
  end
end

