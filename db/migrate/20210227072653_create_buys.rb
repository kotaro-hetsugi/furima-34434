class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :users,   foreign_key: true 
      t.references :product, foreign_key: true 

      t.timestamps
    end
  end
end
