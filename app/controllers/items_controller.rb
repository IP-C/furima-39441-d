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

  def show
    @item = Item.find(params[:id])
    @user_is_seller = user_signed_in? && current_user == @item.user
  end

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def edit
    @item = Item.find(params[:id])
  end  

  def update
    @item = Item.find(params[:id])
  
    # フォームから送信された画像を取得
    new_image = params[:item][:image]
  
    if new_image.present?
      # 新しい画像が送信された場合、既存の画像を置き換える
      @item.image.purge
      @item.image.attach(new_image)
    elsif !@item.image.attached?
      # 画像が選択されておらず、既存の画像も存在しない場合はエラーとせず、何もしない
    end
  
    if @item.update(item_params.except(:image))
      # 商品情報が正常に更新された場合の処理
      redirect_to @item, notice: "商品情報が更新されました。"
    else
      # 商品情報の更新にエラーがある場合の処理
      render 'edit'
    end
  end 
  
  private

  def item_params
    params.require(:item).permit(:name, :item_info, :category_id, :condition_id, :shipping_id, :prefecture_id, :delivery_day_id, :price, :image)
  end
end
