class ProductsController < ApplicationController




  private
  def product_params
    params.require(:product).permit(:name, :text, :category_id, :status_id, :shopping_charge_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end


end
