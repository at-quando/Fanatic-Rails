class OmniAuthController < ApplicationController
  require 'koala'
  def create
    access_token, provider, uid = request_headers
    authSocial = Koala::Facebook::API.new(access_token)
    auth = Authentication.sign_in_with_account_social(access_token, provider, uid, authSocial.get_object('me'), authSocial.get_picture(uid))
    if auth
      response_headers(access_token, provider, uid)
      render json: auth.user, serializer: User::LoginSerializer, status: 200
    else
      render json: { error: 'Invalid social account' }, status: :not_found
    end
  end
end
