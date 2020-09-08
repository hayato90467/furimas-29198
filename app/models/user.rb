class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, presence: true, format: { with: /\A^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]/}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format:  { with: /\A[ァ-ヶー－]+\z/ }
  validates :date, presence: true

  has_many :items
  has_many :purchases
end
