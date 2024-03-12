class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
    if @item.user_id != current_user.id || @item.order != nil 
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,   # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end



  private
  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :municipality, :street_address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
 end

end
