class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user



     #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :cost_bearer_id, :shipping_area_id, :delivery_day_id, numericality: { other_than: 1 , message: " を入力してください"}

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  
  validates :item_name, :explain, :price, :image, presence: true



end
