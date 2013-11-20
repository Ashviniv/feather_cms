module FeatherCms
  class Page < ActiveRecord::Base

    set_table_name :feather_cms_pages

    STATUS = [:draft, :published]
    extend FriendlyId

    attr_accessible :name, :layout, :template_type, :lft, :rgt, :parent_id, :section_ids, :category_id


    validates :name, :category_id, :presence => true
    validates :name, :uniqueness => {:scope => [:status]}

    friendly_id :name, use: :slugged

    has_many :sections, through: :page_sections
    has_many :page_sections
    belongs_to :category

    def title
      self.name
    end
  end
end
