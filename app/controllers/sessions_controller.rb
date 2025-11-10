class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    auth = request.env['omniauth.auth']

    user = User.find_or_initialize_by(provider: auth['provider'], uid: auth['uid'])
    user.email = auth['info']['email']
    user.save!

    session[:user_id] = user.id
    redirect_to root_path, notice: 'Googleログインに成功しました'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
