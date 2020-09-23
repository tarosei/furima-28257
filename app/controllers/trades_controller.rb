class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
                                     
  def index
    
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @trade = TradeForm.new(item_params)
    @item = Item.find(params[:item_id])

    if @trade.valid?
      pay_item
      @trade.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def update
    current_user.update(item_params)
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

end
