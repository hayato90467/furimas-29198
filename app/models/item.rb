class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :name_description, presence: true
  validates :name_category_id, presence: true, numericality: { other_than: 1 }
  validates :name_condition_id, presence: true, numericality: { other_than: 1 }
  validates :send_burden_id, presence: true, numericality: { other_than: 1 }
  validates :send_day_id, presence: true, numericality: { other_than: 1 }
  validates :send_area_id, presence: true, numericality: { other_than: 1}
  validates :price, presence: true,format:  { with: /\A[a-zA-Z0-9]+\z/ },
  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :name_category
  belongs_to_active_hash :name_condition
  belongs_to_active_hash :send_burden
  belongs_to_active_hash :send_day
  belongs_to_active_hash :send_area
end
