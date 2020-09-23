require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品新規出品' do
    it "ログインユーザーが出品ページに遷移でき、画像一枚(ActiveStrage使用)、商品名、商品説明、カテゴリ情報、商品の状態、配送料の負担、発送元の地域、発送日数、価格の情報が必須で、価格により非同期で手数料と利益が変化すること" do
      expect(@item).to be_valid
    end

    it "画像は1枚必須であること(ActiveStorageを使用すること)" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name Name can't be blank")
    end

    it "商品の説明が必須であること" do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain Info can't be blank")
    end    

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Category Select", "Category is not a number")
    end

    it 'カテゴリーの情報が"--"ではデータが保存されないこと' do
      @item.category_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it "商品の状態についての情報が必須であること" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Sales status Select", "Status is not a number")
    end  

    it '商品の状態が"--"ではデータが保存されないこと' do
      @item.status_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.carriage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Carriage Shipping fee status Select", "Carriage is not a number")
    end

    it '配送料の負担について、"--"ではデータが保存されないこと' do
      @item.carriage_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Carriage must be other than 0")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area Prefecture Select", "Area is not a number")
    end

    it '発送元の地域について、"--"ではデータが保存されないこと' do
      @item.area_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.lead_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Lead time Scheduled delivery Select", "Lead time is not a number")
    end

    it '発送までの日数について、"--"ではデータが保存されないこと' do
      @item.lead_time_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Lead time must be other than 0")
    end

    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Price can't be blank", "Price Price Half-width number", "Price Price Out of setting range", "Price This site is only for under 300 and over 9999999")
    end

    it 'priceが半角数字でないと保存できないこと' do
      @item.price = "１１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price This site is only for under 300 and over 9999999")
    end

    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = 200 ||  10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price This site is only for under 300 and over 9999999")
    end  

  end 
end