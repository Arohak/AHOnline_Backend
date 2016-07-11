class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.integer :category_id
      t.string  :label
      t.string  :title
      t.string  :types
      t.integer :position
      t.string  :src

      t.timestamps
    end
  end
end
