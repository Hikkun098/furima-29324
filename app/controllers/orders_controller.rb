class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @order = OrderAddress.new
    return redirect_to root_path if current_user.id == @item.user.id || @item.order != nil
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
