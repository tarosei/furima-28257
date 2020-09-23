class TradeForm
  include ActiveModel::Model

  attr_accessor :token, :postcode, :prefecture, :city, :address_line_1, :address_line_2, :phone, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postcode, presence: { with: /^[0-9]+$/, message:"Poctcode Half-width number.Include hyphen(-)"}
    validates :prefecture, presence: {message: "Prefecture Select"}
    validates :prefecture,numericality: { other_than: 0 } 
    validates :city, presence: {message: "City can't be blank"}
    validates :address_line_1, presence: {message: "Address line 1 can't be blank"}
    validates :phone,  presence: { with: /^[0-9]+$/, message:"Price Half-width number"}
    
  end
 
  def save
    trade = Trade.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture: prefecture, city: city, address_line_1: address_line_1, address_line_2: address_line_2, phone: phone, trade_id: trade.id )
  
  end
end