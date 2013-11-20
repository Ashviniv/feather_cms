class CreateFeatherPageSections < ActiveRecord::Migration
  def change
    create_table :feather_cms_page_sections do |t|
      t.integer :position
      t.integer :page_id
      t.integer :section_id
      t.timestamps
    end
  end
end
