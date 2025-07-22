class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :set_test
  before_action :set_question, only: :show

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def new
    @question = Question.new
  end

  def create
    render plain: "Confirmed!"
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = @test.questions.find(params[:id])
  end

  def render_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end
