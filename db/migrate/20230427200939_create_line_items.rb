class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items, id: :uuid do |t|
      t.integer :quantity
      t.decimal :total_price
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
