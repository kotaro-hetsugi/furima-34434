class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :postal_code,    null: false, default: ""
      t.integer    :prefectures_id, null: false
      t.string     :municipality,   null: false, default: ""
      t.string     :address,        null: false, default: ""
      t.string     :building_name
      t.string     :phone_number,   null: false, default: ""
      t.references :buy,            foreign_key: true 

      t.timestamps
    end
  end
end
