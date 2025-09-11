class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def redirect_back_or_to_root
    redirect_to(cookies.delete(:redirect_to) || root_path)
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      super(resource)
    end
  end
end
