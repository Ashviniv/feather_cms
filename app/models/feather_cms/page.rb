module FeatherCms
  class Page < ActiveRecord::Base

    self.table_name = 'feather_cms_pages'

    STATUS = [:draft, :published]
    extend FriendlyId

    attr_accessible :name, :layout, :template_type, :section_ids, :category_id


    validates :name, :category_id, :presence => true
    validates :name, :uniqueness => {:scope => [:status]}

    friendly_id :name, use: :slugged

    has_many :page_sections
    has_many :sections, -> { order('feather_cms_page_sections.position ASC') }, through: :page_sections
    belongs_to :category

    #accepts_nested_attributes_for :page_sections

    def title
      self.name
    end

    def update_page_sections_position(array)
      self.page_sections.each do |p_section|
        p_section.update_attribute('position', array.index(p_section.section_id))
      end
    end

  end
end
