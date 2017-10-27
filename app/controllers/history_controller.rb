class HistoryController < ApplicationController
  before_action :perform_authorization, only: [:create]

  def index
    @history = current_user.orders.includes(order_items: [product: :properties])
    render json: @history, each_serializer: OrderSerializer, include: [:order_items, order_items: [product: [properties: :images]]]
  end
end
