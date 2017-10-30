class CardPaymentsController < ApplicationController
  before_action :perform_authorization, only: [:create]

  def create
    order = params[:orders]
    orders = create_order(params)
    # create_order_items(order, orders)
    auth = Authentication.find_by(uid: request.headers[:uid], provider: request.headers[:provider])
    payment = CardPayment.create(
      first_name: 'Quan',
      last_name: 'Do',
      card_type: 'visa',
      card_number: '4032037307947289',
      card_verification: '123',
      card_expires_on: DateTime.new(2022, 11),
      order_id: orders.id)
    payment.ip_address = request.remote_ip
    if payment.save
      if payment.purchase(params[:total])
        ConfirmOrderJob.perform_later(auth, orders.order_items.includes(:product, :property).to_a)
        render json: { status: 'ok' }
      else
        render json: { status: 'failed' }
      end
    else
      render json: { status: 'try' }
    end
  end

  def create_order(params)
    current_user.orders.create(
      receiver: params[:receiver],
      address: params[:address],
      phone: params[:phone],
      total: params[:total]
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
