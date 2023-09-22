# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = FactoryBot.build(:user) # FactoryBotを使用してユーザーオブジェクトを生成
      expect(user).to be_valid
    end

    # 以下省略...
  end
end
