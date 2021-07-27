class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, except: [:index, :new, :create]

def index
  @products = Product.all.order("created_at DESC")
end

def new
  @product = Product.new
end

def show
end

def create
  @product = Product.new(product_params)
  if @product.save
    redirect_to root_path
  else
    render :new
  end
end

  private
  def product_params
        params.require(:product).permit(:name, :text, :category_id, :status_id, :shopping_charge_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
