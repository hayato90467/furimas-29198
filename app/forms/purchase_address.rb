class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :prefectures_id, :city, :post, :building, :address, :mobile, :item_id, :token, :user_id

  #  with_options presence: true do
  #   validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  #   validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
  #   validates :city
  #   validates :building
  #   validates :address
  #   validates :mobile
  # validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  # end
  def save
    # 住所の情報を保存
    Address.create(post: post, prefectures_id: prefectures_id, city: city, building: building,
                   address: address, mobile: mobile)
    # 購入者の情報を保存
    Purchase.create(item_id: item_id, user_id: user_id)
  end
end
# end
