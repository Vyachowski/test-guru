class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def edit; end

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

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
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

  def badge_params
    allowed = [:name, :image_url, :active]
    allowed << :rule << :rule_value if action_name == "create"

    params.require(:badge).permit(*allowed)
  end
end
