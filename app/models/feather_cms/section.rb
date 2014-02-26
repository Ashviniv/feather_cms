module FeatherCms
  class Section < ActiveRecord::Base
    table_name = 'feather_cms_sections'
    attr_accessible :name, :content, :category_id
    validates :name, :content, :category_id, presence: true
    belongs_to :category
    has_many :page_sections
  end
end

