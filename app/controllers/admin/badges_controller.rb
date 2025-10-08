class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[show update]

  def index
    @badges = Badge.all
  end

  def show; end

  def update
    if @badge.update(badge_params)
      notice_message = @badge.active ? t(".activated") : t(".deactivated")

      redirect_to admin_badges_path, notice: notice_message
    else
      render :show
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:active)
  end
end
