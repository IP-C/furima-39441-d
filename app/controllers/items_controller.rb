class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @item = Item.new  # 正しい記述
  end

  def create
    @item = Item.new(item_params)  # 正しい記述
    if @item.save
      # 商品の保存に成功した場合の処理
      redirect_to @item, notice: '商品が出品されました。'
    else
      # 商品の保存に失敗した場合の処理
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
end

