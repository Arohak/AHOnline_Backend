class CreateCategoryitemTranslations < ActiveRecord::Migration[5.0]
  def self.up
    Categoryitem.create_translation_table!({ name: :string },
                                           { migrate_data: true })
  end

  def self.down
    Categoryitem.drop_translation_table! migrate_data: true
  end
end
