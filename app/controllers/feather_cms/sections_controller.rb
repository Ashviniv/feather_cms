module FeatherCms
  class SectionsController < ApplicationController

    before_filter :load_section, only: [:show, :edit, :update, :destroy]
    before_filter :load_all_sections, only: [:index]
    before_filter :new_section, only: [:new, :create]
    before_filter :load_categories
    before_filter :load_category, only: [:new]
    layout 'feather_layout'

    def edit
      fetch_category
    end

    def create
      if @section.update_attributes(params[:feather_cms_section])
        redirect_to feather_cms_sections_path
      else
        fetch_category
        render 'new'
      end
    end

    def update
      if @section.update_attributes(params[:feather_cms_section])
        redirect_to feather_cms_sections_path
      else
        fetch_category
        render 'edit'
      end
    end

    def destroy
      @section.destroy
      redirect_to feather_cms_sections_path
    end

    def load_section
      @section = Section.find(params[:id])
    end

    def load_all_sections
      @sections = Section.all
    end

    def new_section
      @section = Section.new
    end

    def load_categories
      @categories = Category.all
    end

    def load_category
      @category = Category.find(params[:category_id])
    end

    def fetch_category
      @category = @section.category
    end

  end
end
