module FeatherCms
  class Category < ActiveRecord::Base
    table_name = 'feather_cms_categories'
    attr_accessible :name
    validates :name, presence: true
    has_many :pages
    has_many :sections
    has_many :page_sections, through: :sections
    has_many :ordered_sections, through: :page_sections, source: 'section', order: 'feather_cms_page_sections.position'

  end
end
