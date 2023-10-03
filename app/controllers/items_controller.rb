class ItemsController < ApplicationController
  def new
    @item = Item.new  # 正しい記述
  end

  def create
    @item = Item.new(item_params)  # 正しい記述
    if @item.save
      # 保存成功時の処理
    else
      # 保存失敗時の処理
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
end

