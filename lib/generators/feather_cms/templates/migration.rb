class CreateFeatherPages < ActiveRecord::Migration
  def change
    create_table :feather_cms_pages do |t|
      t.string :name
      t.string :status, :default => 'draft'
      t.string :layout, :default => 'application'
      t.string :template_type, :default => 'html'
      t.integer :category_id
      t.string :slug
      t.timestamps
    end
    add_index :feather_cms_pages, :slug, unique: true
  end
end
