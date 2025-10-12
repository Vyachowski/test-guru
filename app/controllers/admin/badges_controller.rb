class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def edit
    load_rule_data
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

  def destroy
    @badge.destroy

    redirect_to admin_badges_path
  end

  def new
    @badge = Badge.new(rule_type: params[:rule_type])

    load_rule_data if params[:rule_type].present?
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit([:name, :image_url, :active, :rule_type, :rule_value])
  end

  def load_rule_data
    @rule_type = @badge.rule_type
    @rule_class = "BadgeRules::#{@rule_type.camelize}Rule".safe_constantize
    @form_field = @rule_class&.form_field
    @options = @rule_class&.options || []
  end
end
