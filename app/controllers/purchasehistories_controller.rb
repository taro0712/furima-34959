class PurchasehistoriesController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!, except: [:index, :new]
  #before_action :confirmation, only: [:create, :index]


  def index
    @purchasehistory_address = PurchasehistoryAddress.new
  end

  def new
    @purchasehistory_address = PurchasehistoryAddress.new
  end


  def create
    @purchasehistory_address = PurchasehistoryAddress.new(purchasehistory_params)
    if @purchasehistory_address.valid?
      @purchasehistory_address.save
      redirect_to root_path
    else
      render "purchasehistories/index"
    end
  end



 private

  def set_product
   @product = Product.find(params[:product_id])
  end

  def purchasehistory_params
     params.require(:purchasehistory_address).permit(:postcode, :delivery_area_id, :city, :block, :building, :phone_number ).merge( user_id: current_user.id , product_id: params[:product_id] )
  end

  # def confirmation
  #   redirect_to root_path unless current_user == @product.user
  # end

end