module FeatherCms
  class CategoriesController < ApplicationController
    before_filter :load_category, only: [:show, :edit, :update, :destroy]
    before_filter :load_all_categories, only: [:index]
    before_filter :new_category, only: [:new, :create]
    layout 'feather_layout'

    def create
      if @category.update_attributes(params[:feather_cms_category])
        redirect_to feather_cms_categories_path
      else
        render 'new'
      end
    end

    def update
      if @category.update_attributes(params[:feather_cms_category])
        redirect_to feather_cms_categories_path
      else
        render 'edit'
      end
    end

    def destroy
      @category.destroy
      redirect_to feather_cms_categories_path
    end

    def load_category
      @category = FeatherCms::Category.friendly.find(params[:id])
    end

    def load_all_categories
      @categories = FeatherCms::Category.all
    end

    def new_category
      @category = FeatherCms::Category.new
    end

  end
end
