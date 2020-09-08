class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id,           null:false, foreign_key: true
      t.string  :image,             null:false
      t.string  :name,              null:false
      t.text    :name_description,  null:false
      t.integer :name_category_id,  null:false
      t.integer :name_condition_id, null:false
      t.integer :send_burden_id,    null:false
      t.integer :send_day_id,       null:false
      t.integer :send_area_id,      null:false
      t.string  :price,             null:false
      t.timestamps
    end
  end
end
