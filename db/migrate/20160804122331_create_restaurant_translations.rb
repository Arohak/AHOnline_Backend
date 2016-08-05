class CreateRestaurantTranslations < ActiveRecord::Migration[5.0]
  def self.up
    Restaurant.create_translation_table!({ label:       :string,
                                           description: :string},
                                         { migrate_data: true,
                                           remove_source_columns: true })
  end

  def self.down
    Restaurant.drop_translation_table! migrate_data: true
  end
end
