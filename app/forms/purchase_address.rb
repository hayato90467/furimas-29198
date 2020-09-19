class PurchaseAddress
   include ActiveModel::Model
   attr_accessor :prefectures_id, :city, :post, :building, :address, :mobile, :item_id, :token, :user_id, :purchase_id

   with_options presence: true do
     validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
     validates :city
     validates :building
     validates :address
     validates :mobile, format: { with: /\A\d{10, 11}\z/  }
     validates :token
    end
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(purchase_id: purchase.id, post: post, prefectures_id: prefectures_id, city: city, building: building,
                   address: address, mobile: mobile)
  end
end

