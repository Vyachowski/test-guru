class Admin::BaseController < Admin::BaseController
  before_action :authenticate_user!
  before_action :admin_required!

  layout "admin"

  private

  def admin_required!
    redirect_to root_path, alert: "Вы не авторизованы просматривать эту страницу." unless current_user.is_a?(Admin)
  end
end
