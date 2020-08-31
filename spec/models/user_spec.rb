require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameとemail、first_name、メールアドレスは@を含む必要があること、パスワードは半角英数字混合であること、last_name、first_name_kana、last_name_kana、birthday、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end
    
    it "nicknameが空では登録できないこと" do
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end    

    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name は全角で入力してください。")
    end  

    it 'first_name_kanaが全角カタカナでないと保存できないこと' do
      @user.first_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
    end

    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end

    it 'last_name_kanaが全角カタカナでないと保存できないこと' do
      @user.last_name_kana  = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい。")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end  

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end 

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end 

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "メールアドレスは@を含む必要があること" do 
      @user.email = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
      
    it "パスワードは半角英数字混合であること" do
      @user.password = "あ感"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)", "Password パスワードは半角英数字混合であること")
    end
  
  end
end