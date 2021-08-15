class PurchasehistoriesController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @purchasehistory_address = PurchasehistoryAddress.new
  end

  def create
    @purchasehistory_address = PurchasehistoryAddress.new(purchasehistory_params)
    if @purchasehistory_address.valid?
      pay_item
      @purchasehistory_address.save
      redirect_to root_path
    else
      render 'purchasehistories/index'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchasehistory_params
    params.require(:purchasehistory_address).permit(:postcode, :delivery_area_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchasehistory_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @product.user || @product.purchasehistory.present?
  end
end
