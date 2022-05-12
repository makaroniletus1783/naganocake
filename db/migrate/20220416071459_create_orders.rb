class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :pay_method, default: 0
      t.integer :status, default: 0
      t.integer :total_payment
      t.integer :shipping_fee

      t.timestamps
    end
  end
end
