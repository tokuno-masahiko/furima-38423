class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :house_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.item_fee,  # 商品の値段
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.user_id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

end
