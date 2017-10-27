class OrdersController < ApplicationController
  before_action :perform_authorization, only: [:create]

  def index; end

  # POST /orders
  def create
    order = params[:orders]
    orders = create_order(params)
    create_order_items(order, orders)
    auth = Authentication.find_by(uid: request.headers[:uid], provider: request.headers[:provider])
    ConfirmOrderJob.perform_later(auth, orders.order_items.includes(:product, :property).to_a)
    render json: orders.order_items
  end

  private
    def create_order(params)
      current_user.orders.create(
        receiver: params[:receiver],
        address: params[:address],
        phone: params[:phone]
      )
    end

    def create_order_items(order, orders)
      order.each do |ord|
      orders.order_items.create(
        quantity: ord['quantity'],
        total: ord['quantity'] * Property.find(ord['property']).price,
        property_id: ord['property']
      )
    end
    end
end
