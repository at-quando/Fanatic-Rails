class SuggestSearchController < ApplicationController
  def index
    productSearchName = Product.includes(:category, :properties).where("name like '%#{params[:suggest_name]}%'")
    render json: productSearchName, each_serializer: Product::SuggestNameSerializer, include: [:properties, :category, { properties: :images }]
  end
end
