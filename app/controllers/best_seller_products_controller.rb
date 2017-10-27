class BestSellerProductsController < ApplicationController
   def index
    product = Product.includes(:category, :properties, :shop).where('category_id in (10, 11, 15, 16, 17, 21, 22, 23, 24)').order(number_review: 'desc').limit(4)
    render json: product, each_serializer: Product::DetailSerializer, include: [:shop, :properties, :category, { properties: :images }]
  end
end
