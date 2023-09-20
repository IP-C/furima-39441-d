require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(
      nickname: "ExampleUser",
      email: "user@example.com",
      password: "password123",
      password_confirmation: "password123",
      last_name: "山田",
      first_name: "太郎",
      last_name_kana: "ヤマダ",
      first_name_kana: "タロウ",
      birth_date: Date.new(1990, 1, 1)
    )
    expect(user).to be_valid
  end

  it "is not valid without a nickname" do
    user = User.new(email: "user@example.com")
    expect(user).to_not be_valid
  end

  # 他のバリデーションに対するテストも同様に記述
end
