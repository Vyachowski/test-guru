class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :set_test, only: [:show, :edit, :update, :destroy]

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
      redirect_to test_path(@test), notice: "Тест успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test), notice: "Тест успешно обновлен"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  private

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
