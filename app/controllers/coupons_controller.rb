class CouponsController < ApplicationController
  def index
    coupon = params[:coupon]
    sale = Coupon.select(:sale).find_by(code: coupon)
    if sale
      render json: sale
    else 
      render json: {status: false}
    end
  end
end
