class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    render json: @test.questions
  end

  def show
    render json: @test.questions.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  private

  def render_not_found
    render json: { errors: "Record not found" }, status: :not_found
  end
end
