class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

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

  def show
    @item = Item.find(params[:id])
    @user_is_seller = user_signed_in? && current_user == @item.user
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def destroy
    @item = Item.find(params[:id])
  
    if current_user == @item.user
      @item.destroy
      redirect_to root_path, notice: "商品を削除しました。"
    else
      redirect_to root_path, alert: "他のユーザーの商品を削除できません。"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_info, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :price, :image)
  end
end
