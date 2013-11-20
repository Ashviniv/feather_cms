class CreateFeatherCategories < ActiveRecord::Migration
  def change
    create_table :feather_cms_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
