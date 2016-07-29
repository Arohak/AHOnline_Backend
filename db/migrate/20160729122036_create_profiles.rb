class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :image
      t.string  :email

      t.integer :mobile_number
      t.string  :verification_code
      t.boolean :is_verified

      t.timestamps
    end
  end
end
