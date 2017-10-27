class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  def index
    params[:page] = params[:page].to_i > 0 ? params[:page].to_i : 1
    @count = Category.find_by(title: params[:title].capitalize).products.where(brand_id: params[:brand_id].to_i > 0 ? params[:brand_id].to_i : CategoryBrand.select(:brand_id).where(category_id: Category.find_by(title: params[:title]).id)).count
    @products = Category.find_by(title: params[:title].capitalize).products.includes(:shop, :properties).where(brand_id: params[:brand_id].to_i > 0 ? params[:brand_id].to_i : CategoryBrand.select(:brand_id).where(category_id: Category.find_by(title: params[:title]).id)).limit(8).offset((params[:page] - 1) * 8)
    render json: @products, each_serializer: Product::DetailSerializer, include: [:shop, :category, { properties: :images }], meta: { count: @count }
  end

  # GET /products/1
  def show
    render json: @product, serializer: Product::DetailSerializer, include: [:brand, :shop, :category, { properties: :images }]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
  end
