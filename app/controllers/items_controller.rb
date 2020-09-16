class ItemsController < ApplicationController
  before_action :move_to_new_user_session, only: :new

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :introduction, :category_id, :status_id, :postage_id, :area_id, :day_id, :price, user_ids:[]).merge(user_id: current_user.id,)
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
