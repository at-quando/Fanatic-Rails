class ShopProductsController < ApplicationController
  def index
    params[:page] = params[:page].to_i > 0 ? params[:page].to_i : 1
    @count = Product.includes(:category, :shop, :properties).where(shop_id: params[:id]).count
    @products = Product.includes(:category, :shop, :properties).where(shop_id: params[:id]).limit(12).offset((params[:page] - 1) * 12)
    render json: @products, each_serializer: Product::DetailSerializer, include: [:shop, :category, { properties: :images }], meta: { count: @count }
  end
end
