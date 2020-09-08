class Item < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :name_description, presence: true
  validates :name_category_id, presence: true, numericality: { other_than:1}
  validates :name_condition_id, presence: true, numericality: { other_than:1}
  validates :send_burden_id, presence: true, numericality: { other_than:1}
  validates :send_day_id, presence: true, numericality: { other_than:1}
  validates :send_area_id, presence: true, numericality: { other_than:1}
  validates :price, presence: true
  
   belongs_to :user
  # # has_one : purchase

  belongs_to_active_hash :name_category_id
  belongs_to_active_hash :name_condition_id
  belongs_to_active_hash :send_burden_id
  belongs_to_active_hash :send_day_id
  belongs_to_active_hash :send_area_id

end
