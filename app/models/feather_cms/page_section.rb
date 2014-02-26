module FeatherCms
  class PageSection < ActiveRecord::Base
    table_name = 'feather_cms_page_sections'
    attr_accessible :position

    belongs_to :page
    belongs_to :section
  end
end
