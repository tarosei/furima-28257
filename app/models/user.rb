class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image       
  has_many :trades
  has_many :address
  has_many :items
  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true,
              format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
  validates :first_name_kana, :last_name_kana, presence: true, 
              format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。" }
  validates :birthday, presence: true
  validates :password, presence: true,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message:  "パスワードは半角英数字混合であること" }      
end      
