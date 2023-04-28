class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :name
      t.string :shipping_address
      t.string :phone_number
      t.string :payment_method
      t.references :cart, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
