class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました。'
    else
      render 'new'
    end
  end

  def index
    # 全ての商品を取得
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_info, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :price, :image)
  end

  def sold_out?
    self.stock == 0
  end

end
