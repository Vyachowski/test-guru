class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[update]

  def index
    @badges = Badge.all
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :show
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit([:active, :name])
  end
end
