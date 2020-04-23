class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :payment_method
      t.integer :postage
      t.integer :payment_amount
      t.integer :status
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name

      t.timestamps
    end
  end
end
