class CreateFeatherSections < ActiveRecord::Migration
  def change
    create_table :feather_cms_sections do |t|
      t.string :name
      t.text   :content
      t.integer :category_id
      t.timestamps
    end
  end
end
