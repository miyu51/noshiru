class UsersController < ApplicationController
  before_action :require_login

  def my_page
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
