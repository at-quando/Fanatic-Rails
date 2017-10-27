class UsersController < ApplicationController
  before_action :perform_authorization, only: %i[show update]

  def create
    user = User.new(user_params)
    if user.save
      if !Authentication.find_by(uid: params[:uid])
        auth = user.authentications.create(password: params[:password], uid: params[:uid], access_token: [])
        auth.generate_confirm_token
        ConfirmEmailSignUpJob.perform_later(auth)
        render json: user, status: :created
      else
        user.delete
        render json: { error: 'Your email is valid!' }
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: current_user, serializer: User::LoginSerializer
  end

  def update
    result = Cloudinary::Uploader.destroy(current_user.avatar, options = {}) if current_user.avatar != params[:user][:avatar]
    if current_user.update(user_params)
      render json: current_user, serializer: User::LoginSerializer
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :gender, :address, :avatar)
  end
end
