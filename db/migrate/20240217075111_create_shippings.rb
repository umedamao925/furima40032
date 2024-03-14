class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.references :order, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :street_address, null: false
      t.string :building
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end