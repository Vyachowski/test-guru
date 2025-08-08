class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show edit update destroy]

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_question_path(@test, @question), notice: "Вопрос успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test), notice: "Вопрос успешно обновлён"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy

    redirect_to test_path(@question.test), notice: "Вопрос удалён"
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def render_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end
