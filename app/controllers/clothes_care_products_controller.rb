class ClothesCareProductsController < ApplicationController
  def index
    product = Product.includes(:category, :properties, :shop).where('category_id in (25, 26, 27, 28, 29, 30)').order(number_review: 'desc').limit(4)
    render json: product, each_serializer: Product::DetailSerializer, include: [:shop, :properties, :category, { properties: :images }]
  end
end
