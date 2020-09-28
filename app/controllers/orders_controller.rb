class OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
