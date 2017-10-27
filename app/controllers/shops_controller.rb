class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]

  def index
    @shops = Shop.all
    render json: @shops
  end

  def show
    render json: @shop
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
