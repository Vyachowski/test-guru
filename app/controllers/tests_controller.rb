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

  def edit
  end

  def create
    @test = Test.new(params.require(:test).permit(:body))

    if @test.save
      redirect_to test_path(@test), notice: "Тест успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(params.require(:test).permit(:body))
      redirect_to test_path(@test), notice: "Тест успешно обновлен"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: "Тест удален"
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def render_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end
