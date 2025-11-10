# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:firebase]

  # GET /resource/sign_in
  def firebase
    token = params[:id_token]
    decoded_token  = Firebase::Auth::verify_id_token(token)
    uid = decoded_token['uid']
    email = decoded_token['email']

    user = User.find_or_create_by(firebase_uid: uid) do |u|
      u.email = email
      u.password = Devise.friendly_token[0, 20]
    end

    sign_in(user)
    render json: { message: 'ログイン成功', user: user }
  rescue => e
    render json: { error: e.message }, status: :unauthorized
  end

  # POST /resource/sign_in
  # DELETE /resource/sign_out
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
