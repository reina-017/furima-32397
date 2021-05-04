class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :cost_id, :area_id, :days_id, :item_price, :image).merge(user_id: current_user.id)
  end

end
