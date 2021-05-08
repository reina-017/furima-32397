class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
     if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id], order: current_user.id)
  end
end
