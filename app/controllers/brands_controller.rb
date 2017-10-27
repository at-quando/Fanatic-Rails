class BrandsController < ApplicationController
  # GET /brands
  def index
    @brand = CategoryBrand.includes(:brand).where(category_id: Category.find_by(title: params[:title].capitalize).id)
    render json: @brand, option_name: params[:title]
  end
end
