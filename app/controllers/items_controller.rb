class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :introduction, :category_id, :status_id, :postage_id, :area_id, :days_id, :price)
  end
end
