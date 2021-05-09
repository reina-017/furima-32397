class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end  
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
     if @order_form.valid?
      pay_item
    @order_form.save && current_user.id != @item.user_id
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order, :number, :exp_month, :exp_year, :cvc, :token).merge(user_id: current_user.id, item_id: params[:item_id], order: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
