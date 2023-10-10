class ItemsController < ApplicationController
  def index
    # データベースから必要な情報を取得し、出品日時の新しい順に並べる
    @items = Item.where(validation_conditions).order(created_at: :desc)
  end

  private

  def validation_conditions
    # バリデーション条件を設定
    {
      image: { not: nil },
      name: { not: nil },
      price: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
      shipping_fee_payer: { not: nil }
    }
  end
end
