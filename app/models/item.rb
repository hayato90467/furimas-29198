class Item < ApplicationRecord

  validates :text, presence: true
  validates :image, presence: true
  validates :name, presence: true
  validates :name_description, presence: true
  validates :name_category_id, presence: true
  validates :name_condition_id, presence: true
  validates :send_burden_id, presence: true
  validates :send_day_id, presence: true
  validates :area_id, presence: true
  validates :price, presence: true
  
  belongs_to :user
  has_one : purchase

  belongs_toactive_hash : name_category
  belongs_toactive_hash : name_condition
  belongs_toactive_hash : send_burden
  belongs_toactive_hash : send_day
  belongs_toactive_hash : area


  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than:1}
end
