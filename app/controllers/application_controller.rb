class ApplicationController < ActionController::API
  def response_headers(access_token, provider, uid)
    response.headers['Access-Token'] = access_token
    response.headers['Uid'] = uid
    response.headers['Provider'] = provider
  end

  def request_headers
    [request.headers['Access-Token'], request.headers['Provider'], request.headers['Uid']]
  end

  def authorize_user
    _auth = Authentication.find_by(provider: request.headers['Provider'], uid: request.headers['Uid'])
    _auth && _auth.access_token.include?(request.headers['Access-Token']) ? _auth : nil
  end

  def current_user
    authorize_user ? authorize_user.user : nil
  end

  private

  def perform_authorization
    render json: { error: 'Unauthorize' }, status: :unauthorized unless authorize_user
  end
end
