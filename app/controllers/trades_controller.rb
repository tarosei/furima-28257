class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_trade ,only: [:index, :create]             
  
  def index
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @trade = TradeForm.new(item_params)
    if @trade.valid?
      pay_item
      @trade.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: item_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def item_params
    params.permit(:token, :postcode, :prefecture, :city, :address_line_1, :address_line_2, :phone, :item_id).merge(user_id: current_user.id)
  end

  def set_trade
    @item = Item.find(params[:item_id])
  end
end
