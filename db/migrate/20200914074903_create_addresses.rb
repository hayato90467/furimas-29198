class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
        t.integer    :purchase_id,        null: false, foreign_key: true 
        t.integer    :prefectures_id,     null: false
        t.string     :city,               null: false
        t.string     :post,               null: false
        t.string     :address,            null: false
        t.string     :building
        t.string     :mobile,             null: false
        t.timestamps
    end
  end
end
