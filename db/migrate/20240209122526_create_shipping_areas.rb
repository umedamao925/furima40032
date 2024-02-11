class CreateShippingAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_areas do |t|

      t.timestamps
    end
  end
end
