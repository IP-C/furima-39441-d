class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      # 商品の保存に成功した場合の処理
      redirect_to root_path, notice: '商品が出品されました。'
    else
      # 商品の保存に失敗した場合の処理
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_info, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :price, :image)
  end

  def index
    # ログイン状態にかかわらず、全ての商品を取得する
    @items = Item.order(created_at: :desc)
  end
end

