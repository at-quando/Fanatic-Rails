class SearchController < ApplicationController
  def index
    params[:page] = params[:page].to_i > 0 ? params[:page].to_i : 1
    @product = Product.where("name like '%#{params[:name]}%'")
    @count = Product.where("name like '%#{params[:name]}%'").count
    render json: @product, each_serializer: Product::DetailSerializer, include: [:shop, :category, { properties: :images }], meta: { count: @count }
  end
end
