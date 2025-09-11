class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start
  before_action :authenticate_user!

  layout "admin"

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: "Тест успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: "Тест успешно обновлен"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  def start
    @test_passage = current_user.test_passages.create!(test: @test, correct_questions: 0)

    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_user
    @user = User.first
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def render_not_found
    render json: { error: "Record not found" }, status: :not_found
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end
end
