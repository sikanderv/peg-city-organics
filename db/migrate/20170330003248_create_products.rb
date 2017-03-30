class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :description
      t.boolean :active, default: false
      t.decimal :weight, precision: 8, scale: 3, default: 0.0
      t.decimal :price, precision: 8, scale: 2, default: 0.0
      t.decimal :cost_price, precision: 8, scale: 2, default: 0.0
      t.integer :tax_rate_id
      t.boolean :on_sale, default: false
      t.boolean :featured, default: false
      t.boolean :stock_control, default: true
      t.string  :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
