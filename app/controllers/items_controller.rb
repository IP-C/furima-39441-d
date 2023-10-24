class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]

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

  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def edit
    if current_user == @item.user
      # ユーザーがログインし、出品者かつ商品が売却済みでない場合は編集ページに遷移
    else
      redirect_to root_path
    end
  end

  def update
    # フォームから送信された画像を取得
    new_image = params[:item][:image]

    # 画像が選択されていない場合、既存の画像を保持する
    if new_image.blank?
      @item.image.attach(@item.image.blob) if @item.image.attached?
    else
      # 新しい画像が送信された場合、既存の画像を置き換える
      @item.image.purge
      @item.image.attach(new_image)
    end

    if @item.update(item_params.except(:image))
      # 商品情報が正常に更新された場合の処理
      redirect_to item_path(@item), notice: "商品情報が更新されました。"
    else
      # 商品情報の更新にエラーがある場合の処理
      render 'edit'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :item_info, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :price, :image)
  end
end
