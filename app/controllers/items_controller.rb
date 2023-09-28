class ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @items = Items.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
end