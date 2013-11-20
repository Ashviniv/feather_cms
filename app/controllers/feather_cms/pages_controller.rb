module FeatherCms
  class PagesController < ApplicationController

    before_filter :find_page, :only => [:edit, :update, :destroy, :preview, :show]
    #before_filter :all_page, :except =>  [:preview, :published]
    before_filter :all_page, except: [:index]
    before_filter :load_categories
    before_filter :load_category, only: [:new]
    layout 'feather_layout', :except => [:preview, :published]

    def new
      @page = Page.new
      @page.status = 'draft'
    end

    def index
      #@pages = Page.nested_set.select('id, name, parent_id').all
    end

    def edit
      @draft_page = Page.where(:name => @page.name, :status => 'draft').first
      @published_page = Page.where(:name => @page.name, :status => 'published').first
      @category = @page.category
    end

    def create
      @page = Page.new(params[:feather_cms_page])
      @page.name = @page.name.parameterize

      @page.status = 'draft'
      @page.template_type = 'html'
      @page.update_attributes(section_ids: params[:section_ids].collect(&:to_i)) if params[:section_ids]
      if @page.save
        redirect_to feather_cms_pages_path
      else
        @category = @page.category
        render :new
      end
    end

    def update
      status = params[:feather_cms_page].delete(:status)

      @page.attributes = params[:feather_cms_page]
      @page.name = @page.name.parameterize
      @page.status = status
      @page.template_type = 'html'

      @page.update_attributes(section_ids: params[:section_ids].collect(&:to_i)) if params[:section_ids]
      if @page.save
        redirect_to feather_cms_pages_path
      else
        render :new
      end
    end

    def destroy
      @page.destroy
      redirect_to feather_cms_pages_path
    end

    def preview
      render 'show', :type => @page.template_type, :layout => @page.layout
    end

    def show
      render 'show', :type => @page.template_type, :layout => @page.layout
    end

    def published
      @page = Page.where(:name => params[:feather_cms_name], :status => 'published').first
      if @page
        render :inline => @page.content, :type => @page.template_type, :layout => @page.layout
      else
        redirect_to '/404.html'
      end
    end

    def find_page
      @page = Page.find(params[:id])
    end

    def all_page
      @pages = Page.all
    end

    def load_categories
      @categories = Category.all
    end

    def load_category
      @category = Category.find(params[:category_id])
    end

  end
end
