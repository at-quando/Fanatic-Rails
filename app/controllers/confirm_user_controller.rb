class ConfirmUserController < ApplicationController
  def create
    return render json: { error: 'Token is not present!' }, status: :not_found if params[:confirm_token].blank?
    token = params[:confirm_token]
    auth = Authentication.find_by(uid: params[:uid], provider: params[:provider])
    if auth && auth.confirm_token_valid? && auth.confirm_token == token
      auth.confirmed_email
      auth.save
      return render json: { status: 'ok' }, status: :ok
    else
      return render json: { error: 'Cannot confirmed email!' }
    end
  end
end
