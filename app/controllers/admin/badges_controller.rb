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

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t("admin.badges.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @badge = Badge.new
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:active, :name, :image_url, :rule_type, :rule_value)
  end
end
