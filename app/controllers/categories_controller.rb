class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.menu_categories
    render json: { category: @categories }
  end
end
