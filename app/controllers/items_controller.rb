class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :fee_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
