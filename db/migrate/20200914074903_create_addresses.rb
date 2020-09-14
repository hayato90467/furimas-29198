class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
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
