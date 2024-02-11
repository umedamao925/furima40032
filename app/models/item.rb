class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost_bearer
  belongs_to :shipping_area
  belongs_to :delivery_day
  belongs_to :user


  validates :item_name, :explain, :price, :image, :user_id, :category_id, :condition_id, :cost_bearer_id, :shipping_area_id, :delivery_day_id, presence: true

  validates :category_id, :condition_id, :cost_bearer_id, :shipping_area_id, :delivery_day_id, numericality: { other_than: 1 , message: " を入力してください"}

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "は一覧にありません" }
  
end
