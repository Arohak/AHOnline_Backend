class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string  :title
      t.string  :dateCreate
      t.string  :mobileNumber
      t.string  :deliveryAddress
      t.string  :deliveryCity
      t.string  :deliveryAlias
      t.string  :deliveryDate
      t.string  :payment
      t.decimal :ordersTotalPrice
      t.decimal :deliveryPrice
      t.decimal :totalPrice
      t.boolean :is_verified

      t.timestamps null: false
    end
  end
end
