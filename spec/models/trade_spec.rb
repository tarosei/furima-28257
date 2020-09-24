require 'rails_helper'

RSpec.describe TradeForm, type: :model do
  before do
    @trade = FactoryBot.build(:trade_form)
  end

  describe '商品購入' do
    it "出品者で無いログインユーザーが購入する為に、クレジットカード情報、有効期限、セキュリティコード、郵便番号、都道府県、市町村、番地、電話番号の入力が必須であること。" do
      expect(@trade).to be_valid
    end

    it "建物が空でも登録できること" do
      @trade.address_line_2 = ""
      @trade.valid?
      expect(@trade.errors.full_messages).to include()
    end

    it "tokenが空の場合、商品が購入できないこと" do
      @trade.token = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Token can't be blank")
    end                                 

    it "郵便番号が空では登録できないこと" do
      @trade.postcode = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Postcode Poctcode Half-width number.Include hyphen(-)")
    end

    it "郵便番号にハイフンが必要であること" do
      @trade.postcode = "99999999"
      @trade.valid?
      expect(@trade.errors.full_messages).to include()
    end

    it '都道府県が"--"ではデータが保存されないこと' do
      @trade.prefecture = "0"
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "市町村が空では登録できないこと" do
      @trade.city = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("City City can't be blank")
    end

    it "番地が空では登録できないこと" do
      @trade.address_line_1 = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Address line 1 Address line 1 can't be blank")
    end

    it "電話番号が空では登録できないこと" do
      @trade.phone = nil
      @trade.valid?
      expect(@trade.errors.full_messages).to include("Phone Price Half-width number")
    end

    it "電話番号が11桁以内であること" do
      @trade.phone = "1111111001111"
      @trade.valid?
      expect(@trade.errors.full_messages).to include()
    end

  end
end
