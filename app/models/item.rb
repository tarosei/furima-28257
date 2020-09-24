class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash  :category
  belongs_to_active_hash  :carriage 
  belongs_to_active_hash :status
  belongs_to_active_hash :area
  belongs_to_active_hash :lead_time
  has_one_attached :image
  has_many :trades
  has_one :trade
  with_options presence: true do
    validates :image, presence: { message: "can't be blank" }
    validates :name, presence: {message: "Name can't be blank"}
    validates :explain, presence: {message: "Info can't be blank"}
    validates :price, presence: {message: "Price can't be blank"}
    validates :price,  presence: { with: /^[0-9]+$/, message:"Price Half-width number"}
    validates :price, presence: {message: "Price Out of setting range"}
    validates :category_id, presence: {message: "Category Select"}  
    validates :status_id, presence: {message: "Sales status Select"}
    validates :carriage_id, presence: {message: "Shipping fee status Select"}
    validates :area_id, presence: {message: "Prefecture Select"}
    validates :lead_time_id, presence: {message: "Scheduled delivery Select"}
    validates :price, inclusion: {in: 300..9999999, message: 'This site is only for under 300 and over 9999999'}
    validates :category_id, :status_id, :area_id, :carriage_id, :lead_time_id, numericality: { other_than: 0 } 
  end
end
