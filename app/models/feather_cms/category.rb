module FeatherCms
  class Category < ActiveRecord::Base
    set_table_name :feather_cms_categories
    attr_accessible :name
    validates :name, presence: true
    has_many :pages
    has_many :sections

  end
end
