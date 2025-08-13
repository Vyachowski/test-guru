class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user,
                :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      cookies[:redirect_to] = request.fullpath

      redirect_to login_path, alert: "Вы точно Гуру? Пожалуйста, подтвердите свой имейл и пароль"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_back_or_to_root
    redirect_to(cookies.delete(:redirect_to) || root_path)
  end
end
