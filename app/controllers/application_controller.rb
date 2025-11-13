class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  helper_method :current_user, :user_signed_in?
  allow_browser versions: :modern
  unless Rails.env.development?
    rescue_form ActiveRecord::RecordNotFound, with: :render_404
    rescue_form ActiveController::RoutingError, with: :render_404
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      root_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def require_login
    unless user_signed_in?
      redirect_to root_path, alert: 'ログインしてください。'
    end
  end

  def render_404
    respond_to do |format|
      format.html { redirect_to "/404" }
      format.all { head :not_found }
    end
  end
end
